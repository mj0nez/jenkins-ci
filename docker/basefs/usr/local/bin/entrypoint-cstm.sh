#!/usr/bin/env bash


/usr/local/bin/dockerd-entrypoint.sh & exec $@
