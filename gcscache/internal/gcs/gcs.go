//
// Copyright 2021 Google LLC
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

package gcs

import (
	"context"
	"errors"
	"fmt"
	"io"
	"net/http"

	"cloud.google.com/go/storage"
)

// copies a url to gcs without a full local copy
func SaveURL(ctx context.Context, bucket *storage.BucketHandle, url string, dest string) error {
	res, err := http.Get(url)
	if err != nil {
		return err
	}

	defer res.Body.Close()

	r := res.Body
	if res.StatusCode != http.StatusOK {
		return fmt.Errorf("error on GET %q: %v", url, err)
	}

	obj := bucket.Object(dest)
	w := obj.NewWriter(ctx)

	if _, err = io.Copy(w, r); err != nil {
		return err
	}

	if err = w.Close(); err != nil {
		return err
	}
	return nil
}

func Write(ctx context.Context, bucket *storage.BucketHandle, r io.Reader, dest string) error {
	obj := bucket.Object(dest)
	w := obj.NewWriter(ctx)

	if _, err := io.Copy(w, r); err != nil {
		return err
	}

	if err := w.Close(); err != nil {
		return err
	}

	return nil
}

// returns true if all objects exist, false if any do not
func Exists(ctx context.Context, bucket *storage.BucketHandle, dests ...string) (bool, error) {
	for _, dest := range dests {
		obj := bucket.Object(dest)

		_, err := obj.Attrs(ctx)
		if errors.Is(err, storage.ErrObjectNotExist) {
			return false, nil
		} else if err != nil {
			return false, err
		}
	}

	return true, nil
}
