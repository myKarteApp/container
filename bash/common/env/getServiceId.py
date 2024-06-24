import subprocess
import json
import os
from dotenv import dotenv_values


def get_container_ip(service_name):
    # docker inspect コマンドを実行して、結果を取得
    result = subprocess.run(['docker', 'inspect', service_name], capture_output=True, text=True)
    
    # 実行結果をJSON形式に変換
    inspect_data = json.loads(result.stdout)
    
    # コンテナのIPアドレスを取得
    ip_address = find_ip_addresses(inspect_data)
    
    return ip_address

def find_ip_addresses(data):
    ip_address = None
    if isinstance(data, list):
        for item in data:
            ip_address = find_ip_addresses(item)
            if ip_address:
                break
    elif isinstance(data, dict):
        ip_address = data.get('NetworkSettings', {}).get('Networks', {}).get('my_communication_appNet', {}).get('IPAddress', None)
    return ip_address


# frontendサービスのコンテナIPアドレスを取得
service_list = ['backend' ]
result = {}
for service in service_list:
    result[service] = get_container_ip(service)

env_file = '.env'
existing_env = dotenv_values(env_file)

# 新しい値を .env ファイルに書き込む
with open(env_file, 'w') as f:
    for service, ip_address in result.items():
        if service.upper() + '_IP' in existing_env:
            # 既存の定義がある場合は上書き
            existing_env[service.upper() + '_IP'] = ip_address
        else:
            # 既存の定義がない場合は新たに追加
            existing_env.update({service.upper() + '_IP': ip_address})
    for key, value in existing_env.items():
        f.write(f"{key}={value}\n")