FROM alpine:3.12 AS builder

LABEL maintainer="Docker Maintainers <chaiyd.cn@gmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update

ARG ROCKETMQ_VER=4.8.0
ARG ROCKETMQ_NAME=rocketmq-all-$ROCKETMQ_VER-bin-release
ARG ROCKETMQ_URL=https://downloads.apache.org/rocketmq/${ROCKETMQ_VER}/${ROCKETMQ_NAME}.zip

RUN wget -c ${ROCKETMQ_URL} && \
    unzip ${ROCKETMQ_NAME}.zip -d /opt


FROM mcr.microsoft.com/java/jdk:8-zulu-alpine

LABEL maintainer="Docker Maintainers <chaiyd.cn@gmail.com>"

ARG ROCKETMQ_VER=4.8.0
ARG ROCKETMQ_NAME=rocketmq-all-$ROCKETMQ_VER-bin-release
ENV ROCKETMQ_ADDR=localhost:9876

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update  \
    && apk add --no-cache ca-certificates bash tzdata dumb-init \
    && cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

#COPY --from=builder /opt/$ROCKETMQ_NAME /opt/rocketmq
COPY --from=builder /opt/rocketmq-${ROCKETMQ_VER} /opt/rocketmq
ADD start.sh /opt/rocketmq
RUN chmod +x /opt/rocketmq/start.sh

WORKDIR /opt/rocketmq
EXPOSE 9876 10911
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "-c", "./start.sh"]
