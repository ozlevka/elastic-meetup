#!/bin/sh

if [ -z "ADD_JAVA_OPTS" ]; then
    su - elastic -s /bin/sh -c "/opt/elasticsearch/bin/elasticsearch --E cluster.name=test $ELASTIC_CMD_OPTIONS"
else
    su - elastic -s /bin/sh -c "ES_JAVA_OPTS=$ADD_JAVA_OPTS && /opt/elasticsearch/bin/elasticsearch --E cluster.name=test $ELASTIC_CMD_OPTIONS"
fi