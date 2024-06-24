#!/bin/sh

export HTTPS=true
export SSL_KEY_FILE=app/client/ssl/key.pem
export SSL_CRT_FILE=app/client/ssl/cert.pem

cd app/client
HTTPS=true npx yarn run start:https:local