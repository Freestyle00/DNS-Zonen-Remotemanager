#!/bin/bash

mkdir -p ./secrets

if [ ! -f "./secrets/secrets.yml"  ]; then
(
    echo "---"
    echo "TsigKey: "
    echo "WebhookSecret: "
) > ./secrets/secrets.yml
fi

TSIGKEY=$(keymgr -t my_name hmac-sha384 | awk '{print $2}' | tail -n 1)

sed "s|^TsigKey:.*\$|TsigKey: $TSIGKEY|" -i ./secrets/secrets.yml
