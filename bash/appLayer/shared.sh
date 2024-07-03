#!/bin/bash

mkdir -p appLayer/backend/project/src/shared
mkdir -p appLayer/client/project/src/shared

cp -r shared/ appLayer/backend/project/src/shared
cp -r shared/ appLayer/client/project/src/shared

if [ "$1" = "lint" ]; then
  bash bash/appLayer/lint.sh
fi

ls -al appLayer/client/project/src/shared