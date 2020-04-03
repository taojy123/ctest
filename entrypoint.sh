#!/bin/bash

mkdir -p  /var/data;

if [[ -z "$1" ]]; then
    bash
elif [[ "$1" = "worker" ]]; then
    echo "run celery worker";
    exec celery worker -A app -l info
elif [[ "$1" = "flower" ]]; then
    echo "run celery flower";
    flower -A app --address=0.0.0.0 --db=/var/data/flower.db --persistent=True;
else
    echo "$@"
    exec $@
    exec "touch -f /var/*"
fi
