#!/bin/sh

ls /var/lib/elasticsearch

opts=""
if [ -f "$vol/elasticsearch.yml" ]; then
  opts="-Des.path.home=$vol";
else 
    echo "elasticsearch config not found"
fi

commands=""
if [ -f "/var/lib/elasticsearch/javaopts.sh" ]; then
    commands=`cat /var/lib/elasticsearch/commands`
fi

exec /opt/elasticsearch/bin/elasticsearch $commands $opts
