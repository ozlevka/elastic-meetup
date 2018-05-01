FROM alpine:3.6


ENV KIBANA_VERSION=5.6.3 \
	KIBANA_NAME=kibana

ENV KIBANA_URL=https://artifacts.elastic.co/downloads/$KIBANA_NAME/$KIBANA_NAME-$KIBANA_VERSION-linux-x86_64.tar.gz


RUN apk add --update openssl nodejs bash curl jq wget \
    && adduser -D -S elastic\
    && echo "[i] Start install kibana" \
    && wget -T 15 -O /tmp/$KIBANA_NAME-$KIBANA_VERSION-linux-x86_64.tar.gz $KIBANA_URL \
    && mkdir /opt \
    && tar -xzf /tmp/$KIBANA_NAME-$KIBANA_VERSION-linux-x86_64.tar.gz -C /opt/ \
    && ln -s /opt/$KIBANA_NAME-$KIBANA_VERSION-linux-x86_64 /opt/$KIBANA_NAME \
    && rm -rf /opt/$KIBANA_NAME/node/ \
    && mkdir -p /opt/$KIBANA_NAME/node/bin/ \
    && ln -s $(which node) /opt/$KIBANA_NAME/node/bin/node \
    && chown -R elastic /opt/$KIBANA_NAME-$KIBANA_VERSION-linux-x86_64 \
    && echo "[i] Done"

ENV PATH=/opt/kibana/bin:$PATH

COPY entrypoint.sh /
COPY kibana.yml /opt/$KIBANA_NAME-$KIBANA_VERSION-linux-x86_64/config/

CMD ["./entrypoint.sh"]