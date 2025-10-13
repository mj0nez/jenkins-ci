#!/usr/bin/env bash

if [[ -n "$UPDATE_CA_CERTS" ]]; then
    update-ca-certificates
fi

# start the docker process but give it some time to come up
/usr/local/bin/dockerd-entrypoint.sh &
sleep 5 && exec "$@"
