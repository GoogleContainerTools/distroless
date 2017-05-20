package main

import (
	"crypto/x509"
	"fmt"
	"os"
)

func main() {
	pool, err := x509.SystemCertPool()
	if err != nil {
		fmt.Printf("Error %s loading system certs.\n", err)
		os.Exit(1)
	}
	if pool == nil {
		fmt.Println("No cert pools.")
		os.Exit(1)
	}
	fmt.Println("Certs working!")
}
