#!/bin/bash

#!/bin/bash

bash bash/common/generateEnv.sh
bash bash/common/generateEnv.sh
bash bash/appLayer/shared.sh 

bash bash/appLayer/lint.sh

# docker
docker-compose -f "docker-compose.yaml" up -d
