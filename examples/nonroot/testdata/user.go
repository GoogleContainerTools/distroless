// Copyright 2017 Google Inc. All rights reserved.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

func main() {
	// We can't use user.Current here because it requires cgo.
	uid := strconv.Itoa(os.Getuid())

	passwd, err := ioutil.ReadFile("/etc/passwd")
	if err != nil {
		fmt.Printf("Error reading /etc/passwd: %v", err)
		return
	}
	for _, line := range strings.Split(string(passwd), "\n") {
		if len(line) == 0 {
			continue
		}
		entries := strings.Split(line, ":")
		name, id := entries[0], entries[2]
		if id == uid {
			fmt.Println("User:", name)
			fmt.Println("Uid:", id)
			return
		}
	}
}
