#!/bin/bash

grunt build

cd container
rm -rf app
mkdir app
mkdir app/node_modules

cp -r ../node_modules/node-etcd ../node_modules/lodash ../node_modules/express ../node_modules/socket.io ../node_modules/traceur-runtime ./app/node_modules/
cp -r ../dist ./app

sudo docker build -t cloudlauncher/benchmark-viewer .
sudo docker push cloudlauncher/benchmark-viewer