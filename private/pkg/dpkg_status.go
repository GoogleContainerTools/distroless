package main

import (
	"archive/tar"
	"compress/gzip"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"time"

	"github.com/ulikunitz/xz"
)

const DPKG_STATUS_DIR = "./var/lib/dpkg/status.d"

func main() {
	var control, packageName, output string
	flag.StringVar(&control, "control", "", "")
	flag.StringVar(&packageName, "package-name", "", "")
	flag.StringVar(&output, "output", "", "")
	flag.Parse()

	controlFile, err := os.Open(control)
	panicIfErr(err)
	defer controlFile.Close()

	var controlReader io.Reader = controlFile
	switch filepath.Ext(control) {
	case ".xz":
		controlReader, err = xz.NewReader(controlFile)
		panicIfErr(err)
	case ".gz":
		controlReader, err = gzip.NewReader(controlFile)
		panicIfErr(err)
	}
	controlTar := tar.NewReader(controlReader)

	outputFile, err := os.Create(output)
	panicIfErr(err)
	defer outputFile.Close()
	outputTar := tar.NewWriter(outputFile)
	defer outputTar.Close()

	seenDpkgDir := false

	if !seenDpkgDir {
		err = outputTar.WriteHeader(&tar.Header{
			Name:       DPKG_STATUS_DIR,
			Typeflag:   tar.TypeDir,
			Mode:       0o755,
			ChangeTime: time.Now(),
		})
		panicIfErr(err)
	}

	for {
		header, err := controlTar.Next()
		if err == io.EOF {
			break
		} else {
			panicIfErr(err)
		}

		var rewriteTo string

		if header.Name == "./control" || header.Name == "control" {
			rewriteTo = "%s/%s"
		} else if header.Name == "./md5sums" || header.Name == "md5sums" {
			rewriteTo = "%s/%s.md5sums"
		} else {
			continue
		}
		if header.Typeflag != tar.TypeReg {
			log.Fatalf("%s is not a regular file.", header.Name)
		}
		newHeader := header
		newHeader.Name = fmt.Sprintf(rewriteTo, DPKG_STATUS_DIR, packageName)
		err = outputTar.WriteHeader(header)
		panicIfErr(err)
		_, err = io.Copy(outputTar, controlTar)
	}
}

func panicIfErr(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
