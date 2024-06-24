#!/bin/sh
source bash/common/createDir.sh

# SSLディレクトリを作成する
create_directory_if_not_exists "infra/reverse_proxy/ssl"

yes '' | openssl req -x509 -newkey rsa:4096 -keyout infra/reverse_proxy/ssl/key.pem -out infra/reverse_proxy/ssl/cert.pem -days 365 -nodes

