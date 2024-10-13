#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

docker-compose down
docker image remove bluffit-app

cd ..
rm -rf "$DIR" &
curl -0 "https://github.com/mavdotjs/bluffit/releases/latest/download/container.zip"
unzip ./container.zip
cd container