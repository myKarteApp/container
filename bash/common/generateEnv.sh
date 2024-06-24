#!/bin/bash

rm app/backend/app/.env
rm app/client/.env
rm infra/reverse_proxy/build/.env

# サービスのIPを記載する
# python bash/common/env/getServiceId.py

# Proxyのヘッダーを追加する
python bash/common/env/generateProxyHeader.py

env_file=".env"
# 空行やコメント行、スペースを削除して .env ファイルをコピー
grep -vE '^\s*($|#)' "$env_file" > app/backend/app/.env
grep -vE '^\s*($|#)' "$env_file" > app/client/app/.env
grep -vE '^\s*($|#)' "$env_file" > infra/reverse_proxy/build/.env

# cp .env app/backend/app/.env
# cp .env infra/reverse_proxy/build/.env

ls app/backend/app/.env
cat infra/reverse_proxy/build/.env
