#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"
cd ..

docker build -t jokebox -f docker/jokebox/Dockerfile .
docker build -t quotebox -f docker/quotebox/Dockerfile .
