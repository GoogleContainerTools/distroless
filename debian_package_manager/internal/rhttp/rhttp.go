package rhttp

import (
	"fmt"
	_http "net/http"
	"time"
)

func Get(url string) (*_http.Response, error) {
	retry := 0
do:
	resp, err := _http.Get(url)
	if err == nil {
		fmt.Printf("URL: %s, Status: %s\n", url, resp.Status)
		if resp.StatusCode == _http.StatusGatewayTimeout && retry < 10 {
			fmt.Printf("Retrying: %s\n", url)
			retry += 1
			time.Sleep(time.Second * time.Duration(retry))
			goto do
		}
	} else {
		fmt.Printf("URL: %s, Status: %s\n", url, resp.Status)
	}

	return resp, err
}
