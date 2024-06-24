#!/bin/bash

# cd app/client
# npx yarn run build
# cd ../../

# cp app/client/dist/index.html infra/reverse_proxy/static/client/index.html
# cp -r app/client/dist/assets/. infra/reverse_proxy/static/assets

# bash bash/common/generateEnv.sh
# bash bash/common/generateEnv.sh
# bash bash/app/generateShared.sh 
docker-compose -f "docker-compose.yaml" up -d 
# cd app/client
# npx yarn run build:auto
# docker-compose -f "docker-compose-$1.yaml" up -d 