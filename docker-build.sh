#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Provide version"
  exit 42
fi

version="$1"
docker_version=":$1"

docker build --rm -f Dockerfile_$version -t seges/xwiki$docker_version .
