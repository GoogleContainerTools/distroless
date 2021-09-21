package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strconv"
	"strings"

	"github.com/google/go-containerregistry/pkg/v1/remote"

	"github.com/google/go-containerregistry/pkg/name"
	"github.com/pkg/errors"
)

const (
	registry  = "gcr.io"
	maxImages = 30
)

func main() {
	imagesFile := os.Args[1]
	subsection := os.Args[2]

	images, err := getFullyQualifiedImages(imagesFile, subsection)
	if err != nil {
		log.Fatal(err)
	}
	for _, image := range images {
		fmt.Println(image + ",")
	}
}

func getFullyQualifiedImages(imagesFile, subsection string) ([]string, error) {
	ss, err := strconv.Atoi(subsection)
	if err != nil {
		return nil, err
	}
	images, err := getImages(imagesFile, ss)
	if err != nil {
		return nil, err
	}
	// for each image, get the digest, and then replace the registry
	var fullyQualifiedImages []string
	for _, image := range images {
		if image == "" {
			continue
		}
		ref, err := name.NewTag(image, name.Insecure)
		if err != nil {
			return nil, errors.Wrap(err, "new tag")
		}
		img, err := remote.Image(ref)
		if err != nil {
			return nil, err
		}
		digest, err := img.Digest()
		if err != nil {
			return nil, err
		}
		// replace the registry
		distrolessName := fmt.Sprintf("%s/%s@sha256:%s", registry, ref.RepositoryStr(), digest.Hex)
		fullyQualifiedImages = append(fullyQualifiedImages, distrolessName)
	}

	return fullyQualifiedImages, nil
}

func getImages(imagesFile string, subsection int) ([]string, error) {
	contents, err := ioutil.ReadFile(imagesFile)
	if err != nil {
		return nil, err
	}
	images := strings.Split(string(contents), "\n")
	var subsetImages []string
	for i := subsection * maxImages; i < (subsection+1)*maxImages; i++ {
		if i >= len(images) {
			continue
		}
		subsetImages = append(subsetImages, images[i])
	}

	return subsetImages, nil
}
