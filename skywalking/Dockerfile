FROM alpine:3.14 AS build

LABEL maintainer="<chaiyd.cn@gmail.com>"

ENV SKY_VERSION=8.6.0
RUN wget -c https://archive.apache.org/dist/skywalking/${SKY_VERSION}/apache-skywalking-apm-${SKY_VERSION}.tar.gz \
    && tar -zxvf *.tar.gz

FROM mcr.microsoft.com/java/jdk:8-zulu-alpine

LABEL maintainer="<chaiyd.cn@gmail.com>"
#setting time zone
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add tzdata dumb-init \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

ARG APP=skywalking-agent
ARG JAR_PATH=/home/
ARG JAR=$APP*.jar

ENV APP_NAME=$APP

COPY --from=build /apache-skywalking-apm-bin/agent /$JAR_PATH/agent
#COPY agent $path/agent
#COPY $JAR $JAR_PATH
COPY start.sh $JAR_PATH

WORKDIR $JAR_PATH

RUN chmod +x start.sh
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "-c", "./start.sh"]