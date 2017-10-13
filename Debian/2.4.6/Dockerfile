FROM java:8-jre

ENV ES_NAME=elasticsearch \
	ELASTICSEARCH_VERSION=2.4.6
ENV ELASTICSEARCH_URL=https://download.elastic.co/$ES_NAME/$ES_NAME/$ES_NAME-$ELASTICSEARCH_VERSION.tar.gz

RUN apt-get update && apt-get install -y --assume-yes openssl bash curl wget \
    && mkdir -p /opt \
    && echo '[i] Start create elasticsearch' \
    && wget -T 15 -O /tmp/$ES_NAME-$ELASTICSEARCH_VERSION.tar.gz $ELASTICSEARCH_URL \
    && tar -xzf /tmp/$ES_NAME-$ELASTICSEARCH_VERSION.tar.gz -C /opt/ \
    && ln -s /opt/$ES_NAME-$ELASTICSEARCH_VERSION /opt/$ES_NAME \
    && useradd elastic \
    && mkdir -p /var/lib/elasticsearch /opt/$ES_NAME/plugins /opt/$ES_NAME/config/scripts \
    && chown -R elastic /opt/$ES_NAME-$ELASTICSEARCH_VERSION/


COPY entrypoint.sh /

ENV PATH=/opt/elasticsearch/bin:$PATH
    
CMD ["/bin/bash","./entrypoint.sh" ]