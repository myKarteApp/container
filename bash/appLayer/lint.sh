#!/bin/bash

cd appLayer/backend/project
npm run format
npm run lint

cd ../../../

cd appLayer/client/project
npm run lint

cd ../../../