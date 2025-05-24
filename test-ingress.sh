#!/usr/bin/env bash
set -x

echo "Get JWT"
JWT="$(curl -s "http://127.0.0.1:80/auth" --data username=demo --data password=demo)"
echo -e "\n\n\n"

curl -s "http://127.0.0.1:80/joke" --header "Authorization: JWT $JWT"
echo -e "\n\n\n"

curl -s "http://127.0.0.1:80/quote" --header "Authorization: JWT $JWT"
echo -e "\n\n\n"

BAD_JWT="$(curl -s "http://127.0.0.1:80/expired" --data username=demo --data password=demo)"
echo -e "\n\n\n"

curl -D - "http://127.0.0.1:80/joke" --header "Authorization: JWT $BAD_JWT"
echo -e "\n\n\n"

curl -D - "http://127.0.0.1:80/quote" --header "Authorization: JWT $BAD_JWT"
echo -e "\n\n\n"
