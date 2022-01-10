#!/bin/sh

LISTENERS="listeners=PLAINTEXT://:9092"
ADVERTISED_LISTENERS="advertised.listeners=PLAINTEXT://$HOSTNAME"

set -eux

sed -i s/broker.id=.*/broker.id=$BROKER_ID/g config/server.properties
sed -i s/zookeeper.connect=.*/zookeeper.connect=$ZOOKEEPER_CONNECT/g config/server.properties
sed -i s/zookeeper.connection.timeout.ms=.*/zookeeper.connection.timeout.ms=$ZOOKEEPER_SYNC_TIME/g config/server.properties
sed -i s/num.partitions=.*/num.partitions=$NUM_PARTITIONS/g config/server.properties

echo -e "$LISTENERS\n$ADVERTISED_LISTENERS" >> config/server.properties

./bin/kafka-server-start.sh  config/server.properties