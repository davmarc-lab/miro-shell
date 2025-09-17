#!/usr/bin/env bash

OUT_DIR="scripts/network/"

echo "START script"

printf '%s' "$(nmcli -f in-use,ssid,rate,signal,security -t dev wifi)" | \
jq -sR 'split("\n") | map(split(":")) | map({"in-use": .[0],
                                             "network": .[1],
                                             "rate": .[2],
                                             "signal": .[3],
                                             "security": .[4]})' > ${OUT_DIR}wifi-networks.json

