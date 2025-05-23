#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"

docker run -v $(realpath ../jokebox/jokes):/app/jokes -p 8082:8080 jokebox
docker run -v $(realpath ../quotebox/quotes):/app/quotes -p 8083:8080 quotebox
