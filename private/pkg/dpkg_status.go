package main

import (
	"archive/tar"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"strings"
	"time"

	"github.com/ulikunitz/xz"
)

const DPKG_STATUS_DIR = "./var/lib/dpkg/status.d"

func main() {
	var control, data, packageName, output string
	flag.StringVar(&control, "control", "", "")
	flag.StringVar(&data, "data", "", "")
	flag.StringVar(&packageName, "package-name", "", "")
	flag.StringVar(&output, "output", "", "")
	flag.Parse()

	controlFile, err := os.Open(control)
	panicIfErr(err)
	defer controlFile.Close()

	var controlReader io.Reader = controlFile
	if strings.Contains(control, ".xz") {
		controlReader, err = xz.NewReader(controlFile)
		panicIfErr(err)
	}
	controlTar := tar.NewReader(controlReader)

	outputFile, err := os.Create(output)
	panicIfErr(err)
	defer outputFile.Close()
	outputTar := tar.NewWriter(outputFile)
	defer outputTar.Close()

	dataFile, err := os.OpenFile(data, os.O_RDONLY, os.ModePerm)
	panicIfErr(err)
	defer dataFile.Close()

	var dataReader io.Reader = dataFile
	if strings.Contains(data, ".xz") {
		dataReader, err = xz.NewReader(dataFile)
		panicIfErr(err)
	}
	dataTar := tar.NewReader(dataReader)

	seenDpkgDir := false

	for {
		header, err := dataTar.Next()
		if err == io.EOF {
			break
		} else {
			panicIfErr(err)
		}
		err = outputTar.WriteHeader(header)
		panicIfErr(err)
		_, err = io.Copy(outputTar, dataTar)
		if header.Name == DPKG_STATUS_DIR {
			seenDpkgDir = true
		}
	}

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
