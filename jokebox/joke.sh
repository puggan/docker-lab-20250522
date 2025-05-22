cd -- "$(dirname -- "$0")"
find ./jokes/ -type f -print0 | shuf -z -n 1 | xargs -0 cat
