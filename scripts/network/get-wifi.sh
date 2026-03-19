#!/usr/bin/env bash

OUT_DIR="$HOME/.cache/quickshell/miro-shell/network/"

printf '%s' "$(nmcli -f in-use,ssid,rate,signal,security -t dev wifi)" | \
jq -sR 'split("\n") | map(split(":")) | map({"inUse": .[0],
                                             "ssid": .[1],
                                             "rate": .[2],
                                             "signal": .[3],
                                             "security": .[4]})' > ${OUT_DIR}wifi-networks.json

