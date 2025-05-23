#!/usr/bin/env bash
set -x

echo "Get JWT"
JWT="$(curl -s "http://127.0.0.1:8080/auth" --data username=demo --data password=demo)"

curl -s "http://127.0.0.1:8080/joke" --header "Authorization: JWT $JWT"

curl -s "http://127.0.0.1:8080/quote" --header "Authorization: JWT $JWT"
