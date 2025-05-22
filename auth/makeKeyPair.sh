#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"
if [[ -f "jwt-private.key" || -f "jwt-public.key" ]]; then
  exit 1
fi

openssl genpkey -algorithm RSA -out jwt-private.key -pkeyopt rsa_keygen_bits:4096
openssl rsa -pubout -in jwt-private.key -out jwt-public.key
chmod 600 jwt-private.key
