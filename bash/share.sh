#!/bin/bash
npm run lint
bash bash/common/generateEnv.sh
bash bash/common/generateEnv.sh
bash bash/appLayer/shared.sh 

bash bash/appLayer/lint.sh
