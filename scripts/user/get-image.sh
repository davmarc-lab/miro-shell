#!/usr/bin/env bash

CACHE_DIR="$HOME/.cache/quickshell/miro-shell/user/"
FILE="data.json"

ls ${CACHE_DIR}

for elem in `ls $CACHE_DIR` ; do
    echo ${CACHE_DIR}
done
