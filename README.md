# Dokcer LAB (2025-05-22)

## Summary

4 micro-services in docker containers

* random joke endpoint in the jokebox container, written in bash with netcat/ncat as server

* random quote endpoint in the quotebox continer, writen in c as a socket listener

* an login / authentication endpoint in the auth container, takes username & password, returns a JWT, written in nodejs with express

* gateway service with multipe enpoints, verifying JWT and proxy to the other microservices, written in python with flask

## Preparations

* Install docker and buidtools (TODO make a list of packages needed)

* JWT key-pair, run auth/makeKeyPair.sh to generate a pair

* user database, run auth/makeDemoDb.sh to generate a user-database, use sqlite-tools to change user, comes with a demo user.

* replace placeholders jokes and quotes (in jokebox/jokes and quotebox/quotes)

## Start up using docker-compose

* cd docker

* docker-composer build

* docker-composer up -d

* cd ..

## test it (docker-composer)

* bash test.sh


