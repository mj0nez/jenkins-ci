#!/usr/bin/env bash

# start the docker process but give it some time to come up
/usr/local/bin/dockerd-entrypoint.sh &
sleep 5 && exec "$@"
