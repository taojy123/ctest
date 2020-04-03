#!/bin/bash

mkdir -p  /var/data;

if [[ -z "$1" ]]; then
    echo "run celery worker";
    celery worker -A app -l info;
elif [[ "$1" = "flower" ]]; then
    echo "run celery flower";
    flower -A app --address=0.0.0.0 --db=/var/data/flower.db --persistent=True;
else
    echo "$@"
    exec "$@"
fi
