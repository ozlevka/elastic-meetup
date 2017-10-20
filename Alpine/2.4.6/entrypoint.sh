#!/bin/sh

if [ -z "$ES_HEAP_SIZE" ]; then
    su - elastic -s /bin/sh -c "/opt/elasticsearch/bin/elasticsearch -Dcluster.name=test $ELASTIC_CMD_OPTIONS"
else
    su - elastic -s /bin/sh -c "export ES_HEAP_SIZE=$ES_HEAP_SIZE && /opt/elasticsearch/bin/elasticsearch -Dcluster.name=test $ELASTIC_CMD_OPTIONS"
fi