#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"

docker run -d \
  -v $(realpath ../auth/jwt-private.key):/app/jwt-private.key \
  -v $(realpath ../auth/users.db):/app/users.db \
  -p 8081:8080 auth

docker run -d \
  -v $(realpath ../jokebox/jokes):/app/jokes \
  -p 8082:8080 jokebox

docker run -d \
  -v $(realpath ../quotebox/quotes):/app/quotes \
  -p 8083:8080 quotebox
