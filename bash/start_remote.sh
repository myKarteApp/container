#!/bin/bash

bash bash/common/generateEnv.sh
bash bash/common/generateEnv.sh
bash bash/appLayer/shared.sh 

bash bash/appLayer/lint.sh

# docker
docker-compose -f "docker-compose-prod.yaml" up -d
docker exec backend npm run build
docker exec client npm run build

# clientのビルドしたファイルが
# /usr/share/nginx/staticに存在することを確認する

# client サービスは不要になるので消す
# docker-compose.yml からイメージIDを取得する
client_image_id=$(docker-compose images -q client)
docker stop client
docker rmi $client_image_id