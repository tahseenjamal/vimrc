package main

import (
	"net/url"
)

func urlparsefunc(uristring, parameter string) string {

	uriparsed, err := url.Parse(uristring)

	if err == nil {

		keyvalue, err := url.ParseQuery(uriparsed.RawQuery)

		if err == nil {

			data, err := keyvalue[parameter]

			if err == true {

				return data[0]

			} else {

				return ""
			}

		}
	}

	return ""
}
