#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"

docker buildx build -t puggan/docker-lab-20250522-jokebox:latest -f docker/jokebox/Dockerfile .
docker push puggan/docker-lab-20250522-jokebox:latest
docker buildx build -t puggan/docker-lab-20250522-quotebox:latest -f docker/quotebox/Dockerfile .
docker push puggan/docker-lab-20250522-quotebox:latest
docker buildx build -t puggan/docker-lab-20250522-auth:latest -f docker/auth/Dockerfile .
docker push puggan/docker-lab-20250522-auth:latest
docker buildx build -t puggan/docker-lab-20250522-gateway:latest -f docker/gateway/Dockerfile .
docker push puggan/docker-lab-20250522-gateway:latest
