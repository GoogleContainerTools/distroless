package common

import (
	"archive/tar"
	"bytes"
	"compress/gzip"
	"crypto/sha256"
	"crypto/x509"
	"encoding/binary"
	"encoding/hex"
	"encoding/pem"
	"errors"
	"flag"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"strings"
	"testing"
)

// blockedSPKIs are SHA-256 hashes of the SubjectPublicKeyInfo of roots that must never be trusted by an image.
// Matching on the key (rather than the file name used in BLOCKED_CA_CERTIFICATES) also catches renames and re-issues.
var blockedSPKIs = map[string]string{
	"bd153ed7b0434f6886b17bce8bbe84ed340c7132d702a8f4fa318f756ecbd6f3": "AAA Certificate Services",
	"8d417db2dd8bf5e3084d1e3f196d583849d81bdd4c00c70b9d39369e96b8c782": "emSign ECC Root CA - G3",
}

const (
	pemBundlePath = "etc/ssl/certs/ca-certificates.crt"
	javaStorePath = "etc/ssl/certs/java/cacerts"
)

// TestBlockedRoots checks every archive passed as an argument for trust stores containing a blocked root.
func TestBlockedRoots(t *testing.T) {
	if flag.NArg() == 0 {
		t.Fatal("no archives given")
	}
	for _, archive := range flag.Args() {
		t.Run(archive, func(t *testing.T) {
			stores, err := readStores(archive)
			if err != nil {
				t.Fatal(err)
			}
			if len(stores) == 0 {
				t.Fatalf("no trust store (%s or %s) found", pemBundlePath, javaStorePath)
			}
			for path, data := range stores {
				var certs []*x509.Certificate
				if strings.HasSuffix(path, pemBundlePath) {
					certs, err = parsePEM(data)
				} else {
					certs, err = parseJKS(data)
				}
				if err != nil {
					t.Fatalf("%s: %v", path, err)
				}
				if len(certs) == 0 {
					t.Fatalf("%s: no certificates found", path)
				}
				for _, c := range certs {
					sum := sha256.Sum256(c.RawSubjectPublicKeyInfo)
					if name, ok := blockedSPKIs[hex.EncodeToString(sum[:])]; ok {
						t.Errorf("%s: contains blocked root %q (subject %s)", path, name, c.Subject)
					}
				}
			}
		})
	}
}

func readStores(archive string) (map[string][]byte, error) {
	// archives are passed as rlocationpaths, relative to the runfiles root
	f, err := os.Open(filepath.Join(os.Getenv("TEST_SRCDIR"), archive))
	if err != nil {
		return nil, err
	}
	defer f.Close()
	gz, err := gzip.NewReader(f)
	if err != nil {
		return nil, err
	}
	stores := map[string][]byte{}
	tr := tar.NewReader(gz)
	for {
		hdr, err := tr.Next()
		if errors.Is(err, io.EOF) {
			return stores, nil
		}
		if err != nil {
			return nil, err
		}
		if hdr.Typeflag != tar.TypeReg {
			continue
		}
		if strings.HasSuffix(hdr.Name, pemBundlePath) || strings.HasSuffix(hdr.Name, javaStorePath) {
			data, err := io.ReadAll(tr)
			if err != nil {
				return nil, err
			}
			stores[hdr.Name] = data
		}
	}
}

func parsePEM(data []byte) ([]*x509.Certificate, error) {
	var certs []*x509.Certificate
	for {
		var block *pem.Block
		block, data = pem.Decode(data)
		if block == nil {
			break
		}
		c, err := x509.ParseCertificate(block.Bytes)
		if err != nil {
			return nil, err
		}
		certs = append(certs, c)
	}
	if len(bytes.TrimSpace(data)) != 0 {
		return nil, errors.New("trailing data after last PEM block")
	}
	return certs, nil
}

// parseJKS reads the trusted certificate entries of a JKS keystore. The integrity digest at the end is not verified.
func parseJKS(data []byte) ([]*x509.Certificate, error) {
	r := bytes.NewReader(data)
	var hdr struct{ Magic, Version, Count uint32 }
	if err := binary.Read(r, binary.BigEndian, &hdr); err != nil {
		return nil, err
	}
	if hdr.Magic != 0xFEEDFEED {
		return nil, fmt.Errorf("not a JKS keystore (magic %#x)", hdr.Magic)
	}
	readUTF := func() (string, error) {
		var n uint16
		if err := binary.Read(r, binary.BigEndian, &n); err != nil {
			return "", err
		}
		b := make([]byte, n)
		_, err := io.ReadFull(r, b)
		return string(b), err
	}
	var certs []*x509.Certificate
	for i := uint32(0); i < hdr.Count; i++ {
		var tag uint32
		if err := binary.Read(r, binary.BigEndian, &tag); err != nil {
			return nil, err
		}
		if tag != 2 {
			return nil, fmt.Errorf("entry %d: unexpected entry type %d, only trusted certificates are supported", i, tag)
		}
		if _, err := readUTF(); err != nil { // alias
			return nil, err
		}
		if _, err := r.Seek(8, io.SeekCurrent); err != nil { // creation timestamp
			return nil, err
		}
		if _, err := readUTF(); err != nil { // certificate type
			return nil, err
		}
		var n uint32
		if err := binary.Read(r, binary.BigEndian, &n); err != nil {
			return nil, err
		}
		der := make([]byte, n)
		if _, err := io.ReadFull(r, der); err != nil {
			return nil, err
		}
		c, err := x509.ParseCertificate(der)
		if err != nil {
			return nil, fmt.Errorf("entry %d: %v", i, err)
		}
		certs = append(certs, c)
	}
	return certs, nil
}
