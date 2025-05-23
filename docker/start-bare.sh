#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"


docker ps -q -f "name=auth" | grep -q . && docker stop auth
docker run -d --name auth \
  -v $(realpath ../auth/jwt-private.key):/app/jwt-private.key \
  -v $(realpath ../auth/users.db):/app/users.db \
  -p 8081:8080 auth

docker ps -q -f "name=jokebox" | grep -q . && docker stop jokebox
docker run -d --name jokebox \
  -v $(realpath ../jokebox/jokes):/app/jokes \
  -p 8082:8080 jokebox

docker ps -q -f "name=quotebox" | grep -q . && docker stop quotebox
docker run -d --name quotebox \
  -v $(realpath ../quotebox/quotes):/app/quotes \
  -p 8083:8080 quotebox

docker ps -q -f "name=gateway" | grep -q . && docker stop gateway
docker run -d --name gateway \
  -v $(realpath ../auth/jwt-public.key):/app/jwt-public.key \
  -p 8080:8080 gateway
