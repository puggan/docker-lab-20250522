#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"
cd ..

auth/makeDemoDb.sh
auth/makeKeyPair.sh
docker build -t auth -f docker/auth/Dockerfile .
docker build -t jokebox -f docker/jokebox/Dockerfile .
docker build -t quotebox -f docker/quotebox/Dockerfile .
docker build -t gateway -f docker/gateway/Dockerfile .
