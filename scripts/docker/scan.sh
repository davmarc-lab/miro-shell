#!/usr/bin/env bash

CACHE_DIR="$HOME/.cache/quickshell/miro-shell/docker/"
FILE="data.json"

# sudo docker container list -a --format="json" | jq -s > ${CACHE_DIR}${FILE}
docker container list -a --format="json" | jq -s
