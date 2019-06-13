package main

import (
	"io/ioutil"
	"log"
	"os"

	"github.com/distroless/cacerts/jksutil"
)

func init() {
	log.SetPrefix("[jksutil] ")
	log.SetFlags(log.Lshortfile)
}

// Reads PEM-encoded x509 certs from STDIN and writes a version 2 JKS to STDOUT
func main() {
	pemCerts, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		panic(err)
	}
	certs, err := jksutil.ParsePEMCertificates(pemCerts)
	if err != nil {
		panic(err)
	}
	keyStore, err := jksutil.WithDefaultPassword(certs)
	if err != nil {
		panic(err)
	}
	if err = keyStore.Write(os.Stdout); err != nil {
		panic(err)
	}
}
