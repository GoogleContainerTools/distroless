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

package main

import (
	"io/ioutil"
	"log"
	"os"
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
	certs, err := ParsePEMCertificates(pemCerts)
	if err != nil {
		panic(err)
	}
	keyStore, err := WithDefaultPassword(certs)
	if err != nil {
		panic(err)
	}
	if err = keyStore.Write(os.Stdout); err != nil {
		panic(err)
	}
}
