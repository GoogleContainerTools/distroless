// Copyright 2020 Google Inc. All rights reserved.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.ackage jksutil

// package jksutil allows interactions with a version 2 java key store
package main

import (
	"crypto/sha1"
	"crypto/x509"
	"encoding/binary"
	"hash"
	"io"
	"strings"
	"unicode"
)

const (
	// constants from the openjdk source
	defaultPassword = "changeit"
	keySalt         = "Mighty Aphrodite"
	// we only support writing the latest version
	versionTag int32 = 2
	// private key entries use a tag of 1. We only support storing public certs,
	// known as "trustedCertEntry" in JKS (tag 2).
	trustedCertTag int32 = 2
)

var (
	// magic bytes for the header.
	magic = []byte{0xfe, 0xed, 0xfe, 0xed}
)

// Java Key Store format, as described by:
// share/classes/sun/security/provider/JavaKeyStore.java
//
// Magic number (big-endian integer),
// Version of this file format (big-endian integer),
//
// Count (big-endian integer),
// followed by "count" instances of either:
//
//     {
//      tag=1 (big-endian integer),
//      alias (UTF string)
//      timestamp
//      encrypted private-key info according to PKCS #8
//          (integer length followed by encoding)
//      cert chain (integer count, then certs; for each cert,
//          integer length followed by encoding)
//     }
//
// or:
//
//     {
//      tag=2 (big-endian integer)
//      alias (UTF string)
//      timestamp
//      cert (integer length followed by encoding)
//     }
//
// ended by a keyed SHA1 hash (bytes only) of
//     { password + whitener + preceding body }
//
// NOTE: We only support writing trusted certs (tag=2) for now.
type JavaKeyStore struct {
	password     string
	digest       hash.Hash
	trustedCerts []*x509.Certificate
}

func NewJavaKeyStore(
	password string, trustedCerts []*x509.Certificate) (*JavaKeyStore, error) {

	// We need to initialize the digest before anything is written. JKS adds some
	// "key whitening" to the digest by interlacing the password with 0 bytes and
	// adding a salt at the end.
	digest := sha1.New()
	buf := make([]byte, len(password)*2)
	for i := 0; i < len(password); i++ {
		buf[i*2] = password[i] >> 8
		buf[i*2+1] = password[i]
	}
	if _, err := digest.Write(buf); err != nil {
		return nil, err
	}
	if _, err := digest.Write([]byte(keySalt)); err != nil {
		return nil, err
	}

	return &JavaKeyStore{
		password:     password,
		digest:       digest,
		trustedCerts: trustedCerts,
	}, nil
}

// Opens a new keystore using the default JKS password
func WithDefaultPassword(
	trustedCerts []*x509.Certificate) (*JavaKeyStore, error) {

	return NewJavaKeyStore(defaultPassword, trustedCerts)
}

func (ks *JavaKeyStore) Write(w io.Writer) error {
	// we copy all writes to the digest
	out := io.MultiWriter(w, ks.digest)
	if err := ks.writeHeader(out); err != nil {
		return err
	}
	if err := ks.writeKeys(out); err != nil {
		return err
	}
	// sha1 digest is written at the end of the file
	_, err := w.Write(ks.digest.Sum(nil))
	return err
}

func (ks *JavaKeyStore) writeHeader(w io.Writer) error {
	if _, err := w.Write(magic); err != nil {
		return err
	}
	if err := bigEndianWrite(w, versionTag); err != nil {
		return err
	}
	return bigEndianWrite(w, int32(len(ks.trustedCerts)))
}

func (ks *JavaKeyStore) writeKeys(w io.Writer) error {
	for _, cert := range ks.trustedCerts {
		if err := bigEndianWrite(w, trustedCertTag); err != nil {
			return err
		}
		alias := javaAliasName(cert)
		if err := writeString(w, alias); err != nil {
			return err
		}
		// this is supposed to be the epoch time (in ms) of when the certificate
		// was added to the store. Just always using the 0 epoch to keep things
		// reproducible.
		if err := bigEndianWrite(w, int64(0)); err != nil {
			return err
		}
		// The type of cert
		if err := writeString(w, "X.509"); err != nil {
			return err
		}
		// 4 byte int length + ASN.1 DER encoded cert
		if err := bigEndianWrite(w, int32(len(cert.Raw))); err != nil {
			return err
		}
		// cert.Raw already has the correct encoding
		if _, err := w.Write(cert.Raw); err != nil {
			return err
		}
	}
	return nil
}

// key store aliases should be lowercase and contain no spaces
func javaAliasName(cert *x509.Certificate) string {
	return strings.Map(func(r rune) rune {
		if unicode.IsSpace(r) {
			return -1
		}
		return unicode.ToLower(r)
	}, cert.Subject.String())
}

func bigEndianWrite(w io.Writer, data interface{}) error {
	return binary.Write(w, binary.BigEndian, data)
}

// Strings are written as a 2 byte big-endian length + UTF-8
func writeString(w io.Writer, data string) error {
	// this is not correct...for strings the JKS uses a modified UTF 8 encoding
	// as described here:
	// https://docs.oracle.com/javase/7/docs/api/java/io/DataInput.html#modified-utf-8
	// This means we'll create a corrupt JKS if we encounter a certificate name
	// with a null byte or a character greater than U+FFFF. It seems unlikely
	// enough that we don't worry about doing the correct encoding.
	if err := bigEndianWrite(w, int16(len(data))); err != nil {
		return err
	}
	_, err := w.Write([]byte(data))
	return err
}
