SHELL=bash

TAG ?= 1.5.2

build:
	docker build -t safenetlabs/golang:$(TAG) .
	docker tag safenetlabs/golang:$(TAG) safenetlabs/golang:latest

push:
	docker push safenetlabs/golang:latest
	docker push safenetlabs/golang:$(TAG)