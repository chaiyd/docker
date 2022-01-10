FROM alpine:3.12 AS builder

LABEL maintainer="Docker Maintainers <chaiyd.cn@gmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update

ARG SCALA_VER=2.13
ARG KAFKA_VER=2.8.0
ARG KAFKA_NAME=kafka_$SCALA_VER-$KAFKA_VER
ARG KAFKA_URL=https://downloads.apache.org/kafka/$KAFKA_VER/$KAFKA_NAME.tgz

RUN wget -c $KAFKA_URL && \
    tar -zxvf $KAFKA_NAME.tgz -C /opt && \
    mv /opt/$KAFKA_NAME/* /opt && \
    rm -rf $KAFKA_NAME


FROM mcr.microsoft.com/java/jdk:8-zulu-alpine

LABEL maintainer="Docker Maintainers <chaiyd.cn@gmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update  \
    && apk add --no-cache ca-certificates bash tzdata dumb-init \
    && cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ENV BROKER_ID=0 \
    ZOOKEEPER_CONNECT=localhost:2181 \
    ZOOKEEPER_SYNC_TIME=18000 \
    NUM_PARTITIONS=1

COPY --from=builder /opt/ /opt/kafka
ADD start.sh /opt/kafka
RUN chmod +x /opt/kafka/start.sh

VOLUME /tmp/kafka-logs
WORKDIR /opt/kafka
EXPOSE 9092
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "-c", "./start.sh"]