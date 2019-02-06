FROM       luislavena/mini-java
MAINTAINER Sir <rassoulhosseini@gmail.com>

RUN apk-install ca-certificates curl

ENV ELASTICSEARCH_VERSION 5.6.9

RUN \
  mkdir -p /opt && \
  cd /tmp && \
  curl https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz > elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  tar -xzf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  rm -rf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
  mv elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch

ADD ./elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
ADD ./start.sh /start.sh

VOLUME ["/var/lib/elasticsearch"]

EXPOSE 9200

CMD ["/start.sh"]
