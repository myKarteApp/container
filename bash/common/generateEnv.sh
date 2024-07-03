#!/bin/bash

rm appLayer/backend/project/.env
rm appLayer/client/project/.env
rm infraLayer/proxy/.env

# サービスのIPを記載する
# python bash/common/env/getServiceId.py

# Proxyのヘッダーを追加する
python bash/common/env/generateProxyHeader.py

env_file=".env"
# 空行やコメント行、スペースを削除して .env ファイルをコピー
grep -vE '^\s*($|#)' "$env_file" > appLayer/backend/project/.env
grep -vE '^\s*($|#)' "$env_file" > appLayer/client/project/.env
grep -vE '^\s*($|#)' "$env_file" > infraLayer/proxy/.env


if [ "$1" = "lint" ]; then
  bash bash/appLayer/lint.sh
fi

cat appLayer/backend/project/.env