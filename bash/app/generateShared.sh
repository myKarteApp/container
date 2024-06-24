#!/bin/bash

mkdir -p app/client/src/shared
mkdir -p app/backend/app/src/shared

cp -r shared/. app/client/app/src/shared
cp -r shared/ app/backend/app/src/shared
app/client/app/src