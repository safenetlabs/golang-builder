#!/bin/bash

if ( find /src -maxdepth 0 -empty | read v );
then
  echo "Error: Must mount Go source code into /src directory"
  exit 990
fi

# Grab Go package name
PKG_NAME="$(go list -e -f '{{.ImportComment}}' 2>/dev/null || true)"

if [ -z "$PKG_NAME" ];
then
  echo "Error: Must add canonical import path to root package"
  exit 992
fi

export PKG_NAME

# Grab just first path listed in GOPATH
goPath="${GOPATH%%:*}"

# Construct Go package path
pkgPath="$goPath/src/$PKG_NAME"

# Set-up src directory tree in GOPATH
mkdir -p "$(dirname "$pkgPath")"

# Link source dir into GOPATH
ln -sf /src "$pkgPath"

if [ -e "$pkgPath/Godeps/_workspace" ];
then
  # Add local godeps dir to GOPATH
  GOPATH=$pkgPath/Godeps/_workspace:$GOPATH
  # Add godep bin to path
  PATH=$PATH:$pkgPath/Godeps/_workspace/bin
else
  # Get all package dependencies
  go get -t -d -v ./...
fi

cd $pkgPath

exec "$@"
