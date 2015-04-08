FROM safenetlabs/golang:1.4.2
MAINTAINER SafeNet Labs

ONBUILD COPY ./ /src

CMD ["/build.sh"]
