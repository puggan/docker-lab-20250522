cd -- "$(dirname -- "$0")"
PORT=${1:-8080}
echo "Listening to port:" $PORT
pwd
while true ; do
  ncat -l -k -p 8080 -e ./reply.sh
  echo reconnecting
done
