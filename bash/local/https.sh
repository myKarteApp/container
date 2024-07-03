#!/bin/sh
source bash/common/createDir.sh

# SSLディレクトリを作成する
create_directory_if_not_exists "infraLayer/proxy/ssl"

yes '' | openssl req -x509 -newkey rsa:4096 -keyout infraLayer/proxy/ssl/key.pem -out infraLayer/proxy//ssl/cert.pem -days 365 -nodes

