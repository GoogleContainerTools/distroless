//
// Copyright 2022 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package build

import (
	"context"
	"fmt"
	"net/http"
	"net/url"
	"os"

	"github.com/pkg/errors"
	"github.com/ulikunitz/xz"
	"golang.org/x/sync/errgroup"

	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/build/config"
	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/deb"
	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/rhttp"
)

func extractPackageInfo(snapshots *config.Snapshots, arch config.Arch, distro config.Distro, packages map[string]bool) (map[string]*deb.Package, []string, error) {
	pkgGrp := deb.PackageIndexGroup(snapshots, arch, distro)
	if len(pkgGrp) == 0 {
		// No package index group for this arch/distro, probably there is no
		// previous snapshot.
		return map[string]*deb.Package{}, []string{}, nil
	}

	merged := map[string]*deb.Package{}
	channels := []string{}
	for _, pix := range pkgGrp {
		channels = append(channels, pix.Channel)
		rpi, err := resolvePackages(pix, packages)
		if err != nil {
			return nil, nil, err
		}
		for pkg, pi := range rpi {
			existing, ok := merged[pkg]
			if (ok && deb.CompareVersion(existing.Version, pi.Version) == -1) || !ok {
				merged[pkg] = pi
			}
		}
	}
	if len(merged) != len(packages) {
		fmt.Println(len(merged), len(packages))
		var missing []string
		for pname := range packages {
			if _, ok := merged[pname]; !ok {
				missing = append(missing, pname)
			}
		}
		return nil, nil, fmt.Errorf("packages %q for (%q,%q) were not found in any indexes", missing, arch, distro)
	}
	return merged, channels, nil
}

func resolvePackages(pi *deb.PackageIndex, packages map[string]bool) (map[string]*deb.Package, error) {
	resp, err := rhttp.Get(pi.URL)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to fetch remote file: %s", pi.URL)
	} else if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("failed (status: %v) to fetch remote file: %q", resp.StatusCode, pi.URL)
	}
	br := resp.Body
	defer br.Close()

	xzr, err := xz.NewReader(br)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to xz open package index file %q", pi.URL)
	}

	poolRoot, err := url.Parse(pi.PoolRoot)
	if err != nil {
		panic(err) // we shouldn't be generating bad urls
	}
	pkgs, err := deb.Parse(xzr, packages, poolRoot)
	return pkgs, errors.Wrapf(err, "parsing packages at %q", pi.URL)
}

func checkForUpdates(current *config.Snapshots, latest *config.Snapshots, pkgDB config.Packages) (bool, error) {
	fmt.Print("Looking for updates...")
	for arch, distropackages := range pkgDB {
		fmt.Print(".")
		for distro, packages := range distropackages {
			latestVersions, _, err := extractPackageInfo(latest, arch, distro, packages)
			if err != nil {
				return false, err
			}
			fmt.Print(".")
			currentVersions, _, err := extractPackageInfo(current, arch, distro, packages)
			if err != nil {
				return false, err
			}
			fmt.Print(".")
			for _, l := range latestVersions {
				c, ok := currentVersions[l.Name]
				if !ok {
					fmt.Printf("\nNew package %q: %q\n", l.Name, l.Version)
					return true, nil
				}
				if !l.Equivalent(c) {
					fmt.Printf("\nVersion changed for %q: %q -> %q\n", c.Name, c.Version, l.Version)
					return true, nil
				}
			}
		}
	}
	fmt.Println()
	return false, nil
}

func writeConfig(snapshots *config.Snapshots, snapshotsFile string, pkgDB config.Packages, versionsFile string, archivesFile string) error {
	genSnapshots := &config.Snapshots{
		Debian:   snapshots.Debian,
		Security: snapshots.Security,
		Ports:    snapshots.Ports,
	}

	allPackages := map[string]map[string]map[string]*deb.Package{}
	errs, _ := errgroup.WithContext(context.Background())
	fmt.Printf("Processing packages at debian(%v), security (%v), ports (%v)... \n", snapshots.Debian, snapshots.Security, snapshots.Ports)
	for arch, distropackages := range pkgDB {
		allPackages[arch.String()] = map[string]map[string]*deb.Package{}
		for distro, packages := range distropackages {
			ld := distro
			la := arch
			lp := packages
			errs.Go(func() error {
				packageInfo, channels, err := extractPackageInfo(snapshots, la, ld, lp)
				if err != nil {
					return errors.Wrapf(err, "could not process packages for %q %q", la.String(), ld.String())
				}
				fmt.Printf("%v %v %v\n", ld, la, channels)
				allPackages[la.String()][ld.String()] = packageInfo
				return nil
			})
		}
	}
	if err := errs.Wait(); err != nil {
		return err
	}
	fmt.Printf("Writing archives file: %q\n", archivesFile)
	if err := writeArchivesBzl(archivesFile, allPackages); err != nil {
		return err
	}

	fmt.Printf("Writing version file: %q\n", versionsFile)
	if err := writeVersionsBzl(versionsFile, allPackages); err != nil {
		return err
	}

	fmt.Printf("Writing snapshots file: %q\n", snapshotsFile)
	return config.SaveSnapshots(snapshotsFile, genSnapshots)
}

func Update(snapshotsFile string, packagesFile string, versionsFile string, archivesFile string) error {
	packages, err := config.LoadPackages(packagesFile)
	if err != nil {
		return err
	}

	latest, err := deb.LatestSnapshot()
	if err != nil {
		return err
	}
	snapshot, err := config.LoadSnapshots(snapshotsFile)
	switch {
	case errors.Is(err, os.ErrNotExist):
		fmt.Printf("No snapshot file found at %q, using latest from debian\n", snapshotsFile)
		snapshot = latest
	case err != nil:
		return err
	case snapshot.Equivalent(latest):
		fmt.Println("No new snapshots found.")
		os.Exit(0)
	default:
		needUpdate, err := checkForUpdates(snapshot, latest, packages)
		if err != nil {
			return err
		}
		if !needUpdate {
			fmt.Println("No package updates detected.")
			os.Exit(0)
		}
		snapshot = latest
	}

	fmt.Println("Updating Config")
	return writeConfig(snapshot, snapshotsFile, packages, versionsFile, archivesFile)
}

func Generate(snapshotsFile string, packagesFile string, versionsFile string, respositoriesFile string) error {
	snapshot, err := config.LoadSnapshots(snapshotsFile)
	switch {
	case errors.Is(err, os.ErrNotExist):
		fmt.Printf("No snapshot file found at %q, using latest snapshots from debian\n", snapshotsFile)
		latest, err := deb.LatestSnapshot()
		if err != nil {
			return err
		}
		snapshot = latest
	case err != nil:
		return errors.Wrapf(err, "loading snapshots file %q", snapshotsFile)
	}

	packages, err := config.LoadPackages(packagesFile)
	if err != nil {
		return errors.Wrapf(err, "error loading packages file %q", packagesFile)
	}
	return errors.Wrapf(writeConfig(snapshot, snapshotsFile, packages, versionsFile, respositoriesFile), "error generating config")
}
