#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

docker compose down
docker image remove bluffit-app

cd ..
rm -rf "$DIR" &
curl -LO "https://github.com/mavdotjs/bluffit/releases/latest/download/container.zip"
unzip ./container.zip
rm container.zip
cd container