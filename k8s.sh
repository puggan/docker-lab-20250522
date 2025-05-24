#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"

kubectl delete configmap jokebox-jokes quotebox-quotes jwt-public-key
kubectl create configmap jokebox-jokes --from-file=jokebox/jokes/
kubectl create configmap quotebox-quotes --from-file=quotebox/quotes/
kubectl create configmap jwt-public-key --from-file=auth/jwt-public.key
kubectl delete secret jwt-private-key users-db
kubectl create secret generic jwt-private-key --from-file=auth/jwt-private.key
kubectl create secret generic users-db --from-file=auth/users.db

kubectl apply -f k8s/
