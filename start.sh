#!/bin/bash

if [ -f .env ]; then
    echo ".env already exists"
else
    RABBITMQ_PASSWORD=$(openssl rand -base64 32 | tr -d 'iI1lLoO0' | tr -d -c '[:alnum:]' | cut -c1-32)
    cat << EOF > .env
RABBITMQ_DEFAULT_USER=admin
RABBITMQ_DEFAULT_PASS=$RABBITMQ_PASSWORD
RABBITMQ_DEFAULT_VHOST=/
EOF
fi

cat << EOF >> .env
RABBITMQ_VERSION=4.0.1-management
HAPROXY_VERSION=2.8.11
EOF

if [ -f .erlang.cookie ]; then
    echo ".erlang.cookie already exists"
else
    ERLANG_COOKIE=$(openssl rand -base64 32 | tr -d 'iI1lLoO0' | tr -d -c '[:alnum:]' | cut -c1-32)
    echo $ERLANG_COOKIE > .erlang.cookie
fi

docker compose up -d


