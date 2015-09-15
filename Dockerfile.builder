FROM safenetlabs/golang:1.5.1
MAINTAINER SafeNet Labs
# This builds an image which will by default create a new docker
# container containing just the go executable

# Install Docker binary
RUN wget -nv https://get.docker.com/builds/Linux/x86_64/docker-latest -O /usr/bin/docker && \
  chmod +x /usr/bin/docker

COPY build.sh /

ONBUILD COPY ./ /src

CMD ["/build.sh"]
