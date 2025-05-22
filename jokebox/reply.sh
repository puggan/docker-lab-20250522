#!/usr/bin/env bash
cd -- "$(dirname -- "$0")"
echo "HTTP/1.1 200 ok"
echo ""
./joke.sh
