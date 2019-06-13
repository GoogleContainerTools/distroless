package jksutil

import (
	"crypto/x509"
	"encoding/pem"
	"fmt"
)

// Parses a series of PEM-encoded x509 certificates
func ParsePEMCertificates(pemCerts []byte) ([]*x509.Certificate, error) {
	var certs []*x509.Certificate
	for len(pemCerts) > 0 {
		var block *pem.Block
		block, pemCerts = pem.Decode(pemCerts)
		if block == nil {
			break
		}
		if block.Type != "CERTIFICATE" || len(block.Headers) != 0 {
			return nil, fmt.Errorf("Non-certificate PEM: %v", block)
		}
		cert, err := x509.ParseCertificate(block.Bytes)
		if err != nil {
			return nil, err
		}
		certs = append(certs, cert)
	}
	return certs, nil
}
