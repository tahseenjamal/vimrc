package main

import (
	"crypto/tls"
	"io/ioutil"
	"net/http"
	"strings"
)

func fcircle(mobile string) (string, string) {

	transCfg := &http.Transport{

		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: transCfg}

	message_body := "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservices.lookup.sdp.bharti.ibm.com\"><soapenv:Header/><soapenv:Body><web:getCircleFromSeries><series>mobile_number</series></web:getCircleFromSeries></soapenv:Body></soapenv:Envelope>"

	message_body = strings.Replace(message_body, "mobile_number", mobile, 1)

	req, err := http.NewRequest("POST", "https://10.2.85.140:9446/NDSLookupService/services/NDSLookupService", strings.NewReader(message_body))

	req.Method = "POST"
	if err != nil {
		return "NA", "NA"
	}

	req.Header.Add("ContentType", "text/xml;charset=UTF-8")
	req.Header.Add("SOAPAction", "http://webservices.lookup.sdp.bharti.ibm.com")

	resp, err := client.Do(req)
	if err != nil {
		return "NA", "NA"
	}

	b, err := ioutil.ReadAll(resp.Body)

	if err != nil {
		return "NA", "NA"
	}

	data := string(b)

	var circle, hub string

	dataarray := strings.Split(data, "<circleName>")
	if len(dataarray) > 1 {
		circle = strings.Split(dataarray[1], "</circleName")[0]
		hubarray := strings.Split(data, "<hubName>")
		if len(hubarray) > 1 {

			hub = strings.Split(hubarray[1], "</hubName>")[0]

		} else {

			hub = "NA"

		}

		return circle, hub
	}

	return "NA", "NA"
}

func fhandset(mobile string) (string, string) {

	transCfg := &http.Transport{

		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
	}

	client := &http.Client{Transport: transCfg}

	message_body := "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservices.lookup.sdp.bharti.ibm.com\"><soapenv:Header/><soapenv:Body><web:getLookUpServiceDetails><getLookUpService><serviceRequester>USSD</serviceRequester><!--Optional:--><lineOfBusiness>mobility</lineOfBusiness><lookupAttribute><searchAttrValue>mobile_number</searchAttrValue></lookupAttribute></getLookUpService></web:getLookUpServiceDetails></soapenv:Body></soapenv:Envelope>"

	message_body = strings.Replace(message_body, "mobile_number", mobile, 1)

	req, err := http.NewRequest("POST", "https://10.2.85.140:9446/NDSLookupService/services/NDSLookupService", strings.NewReader(message_body))

	req.Method = "POST"
	if err != nil {
		return "NA", "NA"
	}

	req.Header.Add("ContentType", "text/xml;charset=UTF-8")
	req.Header.Add("SOAPAction", "http://webservices.lookup.sdp.bharti.ibm.com")

	resp, err := client.Do(req)
	if err != nil {
		return "NA", "NA"
	}

	b, err := ioutil.ReadAll(resp.Body)

	if err != nil {
		return "NA", "NA"
	}

	data := string(b)

	var handsetmanufacturer, handsettype string

	dataarray := strings.Split(data, "<attributeValue>")

	if len(dataarray) > 1 {

		handset := strings.Split(dataarray[1], "</attributeValue>")[0]

		handsetdata := strings.Split(handset, " ")

		if len(handsetdata) > 1 {

			handsetmanufacturer = handsetdata[0]

			handsettype = handsetdata[1]

		} else {

			handsetmanufacturer = "NA"
			handsettype = "NA"

		}

		return handsetmanufacturer, handsettype
	}

	return "NA", "NA"
}
