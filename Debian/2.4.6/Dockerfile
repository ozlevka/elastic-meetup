FROM java:8-jre

ENV ES_NAME=elasticsearch \
	ELASTICSEARCH_VERSION=2.4.1
ENV ELASTICSEARCH_URL=https://download.elastic.co/$ES_NAME/$ES_NAME/$ES_NAME-$ELASTICSEARCH_VERSION.tar.gz

RUN apt-get install -y --assume-yes openssl bash curl jq wget \
    && mkdir -p /opt \
    && echo '[i] Start create elasticsearch' \
    && wget -T 15 -O /tmp/$ES_NAME-$ELASTICSEARCH_VERSION.tar.gz $ELASTICSEARCH_URL \
    && tar -xzf /tmp/$ES_NAME-$ELASTICSEARCH_VERSION.tar.gz -C /opt/ \
    && ln -s /opt/$ES_NAME-$ELASTICSEARCH_VERSION /opt/$ES_NAME \
    && adduser -D -S elastic \
    && mkdir -p /var/lib/elasticsearch /opt/$ES_NAME/plugins /opt/$ES_NAME/config/scripts \
    && chown -R elastic /opt/$ES_NAME-$ELASTICSEARCH_VERSION/


COPY entrypoint.sh /

ENV PATH=/opt/elasticsearch/bin:$PATH

CMD ["entrypoint.sh" ]