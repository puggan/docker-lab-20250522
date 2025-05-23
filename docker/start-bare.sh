#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"

docker run -v $(realpath ../quotebox/quotes):/app/quotes -p 8081:8080 quotebox
