package deb

import (
	"fmt"
	"testing"
	"time"
)

func TestFindSnapshots_noError(t *testing.T) {
	testCases := []struct {
		name       string
		snapshots  [][]byte
		targetDate string
		want       string
	}{
		{"earlier than all picks earliest", [][]byte{[]byte("20200101T123456Z"), []byte("20200102T123456Z")}, "20190101T123456Z", "20200101T123456Z"},
		{"exact match", [][]byte{[]byte("20200101T123456Z"), []byte("20200102T123456Z")}, "20200102T123456Z", "20200102T123456Z"},
		{"later than all picks latest", [][]byte{[]byte("20200101T123456Z"), []byte("20200102T123456Z")}, "20200110T123456Z", "20200102T123456Z"},
		{"match day, ignore seconds", [][]byte{[]byte("20200101T123456Z"), []byte("20200102T123456Z")}, "20200102T000000Z", "20200102T123456Z"},
	}

	for _, tc := range testCases {
		t.Run(fmt.Sprintf("%q", tc.name), func(t *testing.T) {
			td, err := time.Parse(dateFormat, tc.targetDate)
			if err != nil {
				t.Fatal(err)
			}
			got, err := findSnapshot(tc.snapshots, td)
			if err != nil {
				t.Fatal(err)
			}
			if got != tc.want {
				t.Fatalf("got:%v, want:%v", got, tc.want)
			}
		})
	}
}
