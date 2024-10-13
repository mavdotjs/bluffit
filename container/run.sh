#!/bin/bash

docker compose down
rm -rf ./run
docker image remove bluffit-app
docker compose up