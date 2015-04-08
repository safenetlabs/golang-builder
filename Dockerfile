FROM golang:1.4.2
MAINTAINER SafeNet Labs

# Install Docker binary
RUN wget -nv https://get.docker.com/builds/Linux/x86_64/docker-latest -O /usr/bin/docker && \
  chmod +x /usr/bin/docker

#VOLUME /src
VOLUME /out
WORKDIR /src

COPY build_environment.sh /
COPY build.sh /

ENTRYPOINT ["/build_environment.sh"]

CMD ["/build.sh"]
