#!/usr/bin/env bash
set -x

echo "Get JWT"
JWT="$(curl -s "https://lab.puggan.se/auth" --data username=demo --data password=demo)"
echo -e "\n\n\n"

curl -s "https://lab.puggan.se/joke" --header "Authorization: JWT $JWT"
echo -e "\n\n\n"

curl -s "https://lab.puggan.se/quote" --header "Authorization: JWT $JWT"
echo -e "\n\n\n"

BAD_JWT="$(curl -s "https://lab.puggan.se/expired" --data username=demo --data password=demo)"
echo -e "\n\n\n"

curl -D - "https://lab.puggan.se/joke" --header "Authorization: JWT $BAD_JWT"
echo -e "\n\n\n"

curl -D - "https://lab.puggan.se/quote" --header "Authorization: JWT $BAD_JWT"
echo -e "\n\n\n"
