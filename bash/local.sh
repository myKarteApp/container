#!/bin/bash

# ディレクトリのパス
dir_path="./bash/local"

# ディレクトリ内のシェルスクリプトをリストし、名前の順にソート
script_files=$(ls -1 "$dir_path"/*.sh | sort)

# 各シェルスクリプトを順番に実行
for script_file in $script_files; do
    echo "Executing script: $script_file"
    # シェルスクリプトを実行し、yesで自動的に応答
    bash "$script_file"
done
