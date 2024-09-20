#!/bin/bash

if [ -f .env ]; then
    echo ".env already exists"
else
    RABBITMQ_DEFAULT_PASS=$(openssl rand -base64 32 | tr -d 'iI1lLoO0' | tr -d -c '[:alnum:]' | cut -c1-32)
    cat << EOF > .env
RABBITMQ_DEFAULT_USER=admin
RABBITMQ_DEFAULT_PASS=$RABBITMQ_DEFAULT_PASS
RABBITMQ_DEFAULT_VHOST=/
EOF
fi

if [ -f .erlang.cookie ]; then
    echo ".erlang.cookie already exists"
else
    ERLANG_COOKIE=$(openssl rand -base64 32 | tr -d 'iI1lLoO0' | tr -d -c '[:alnum:]' | cut -c1-32)
    echo $ERLANG_COOKIE > .erlang.cookie
fi


docker compose up -d


