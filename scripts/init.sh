#!/bin/bash

CACHE_DIR="$HOME/.cache/quickshell/miro-shell/"

# prepare cache dir
if [[ ! -e $CACHE_DIR ]] then
    mkdir -p $CACHE_DIR
    echo "Cache dir created"
fi

# create network cache dir
if [[ ! -e "${CACHE_DIR}network/" ]] then
    mkdir "${CACHE_DIR}network"
    echo "-- cache: network dir created--"
fi
