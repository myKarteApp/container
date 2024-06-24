#!/bin/sh

# ディレクトリが存在しない場合に作成する関数
create_directory_if_not_exists() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "Created directory: $1"
    else
        echo "Directory already exists: $1"
    fi
}
