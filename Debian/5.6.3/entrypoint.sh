#!/bin/sh

if [ -z "$ADD_JAVA_OPTS" ]; then
    su - elastic -s /bin/sh -c "export ES_JAVA_OPTS=\"-Xms2g -Xmx2g\" && /opt/elasticsearch/bin/elasticsearch --E cluster.name=test $ELASTIC_CMD_OPTIONS"
else
    su - elastic -s /bin/sh -c "export ES_JAVA_OPTS=\"$ADD_JAVA_OPTS\" && /opt/elasticsearch/bin/elasticsearch --E cluster.name=test $ELASTIC_CMD_OPTIONS"
fi