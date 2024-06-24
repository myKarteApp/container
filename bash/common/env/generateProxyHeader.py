import uuid
from dotenv import dotenv_values, set_key

# 新しいUUIDを生成
new_uuid = str(uuid.uuid4())

# .envファイルから既存の環境変数を取得
existing_env = dotenv_values('.env')

# PROXY_TOKENの値を設定
existing_env['PROXY_TOKEN'] = new_uuid

# .envファイルに書き込む
with open('.env', 'w') as f:
    for key, value in existing_env.items():
        f.write(f"{key}={value}\n")

print(f"New UUID added to .env file: {new_uuid}")
