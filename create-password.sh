#!/bin/bash


if [ -z "$1" ]; then
    echo "Please use password as argument"
    exit 1
fi

docker run --rm -it \
   amazon/opendistro-for-elasticsearch:0.9.0 \
   sudo /bin/sh -c '/usr/share/elasticsearch/plugins/opendistro_security/tools/hash.sh -p "$1"'
