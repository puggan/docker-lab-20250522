#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"

docker buildx build \
	--platform linux/amd64,linux/arm/v7 \
	-t puggan/docker-lab-20250522-jokebox:latest \
	-f docker/jokebox/Dockerfile \
	. \
	--push

docker buildx build \
	--platform linux/amd64,linux/arm/v7 \
	-t puggan/docker-lab-20250522-quotebox:latest \
	-f docker/quotebox/Dockerfile \
	. \
	--push

docker buildx build \
	--platform linux/amd64,linux/arm/v7 \
	-t puggan/docker-lab-20250522-auth:latest \
	-f docker/auth/Dockerfile \
	. \
	--push

docker buildx build \
	--platform linux/amd64,linux/arm/v7 \
	-t puggan/docker-lab-20250522-gateway:latest \
	-f docker/gateway/Dockerfile \
	. \
	--push
