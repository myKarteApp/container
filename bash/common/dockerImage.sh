#!/bin/bash

# サービス名を指定
service_name="$1"

# docker-compose.yml からイメージIDを取得する
image_id=$(docker-compose images -q $service_name)

echo "Image ID for service '$service_name' is: $image_id"

# service_name="$1"

# # 関数定義
# get_image_id() {
#     # docker-compose.yml からイメージIDを取得する
#     local image_id=$(docker-compose images -q "$1")
#     echo "$image_id"
# }
