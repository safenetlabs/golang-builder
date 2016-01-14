FROM golang:1.5.3
MAINTAINER SafeNet Labs

RUN rm /usr/local/bin/go-wrapper
COPY go-wrapper /usr/local/bin/
RUN mkdir /src
WORKDIR /src
ENTRYPOINT ["go-wrapper"]
