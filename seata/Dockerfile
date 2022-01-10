FROM alpine AS builder

LABEL maintainer="Docker Maintainers <chaiyd.cn@gmail.com>"
#setting time zone

ARG VERSION=1.4.2
ARG APP_NAME=seata-server-$VERSION

RUN wget -c https://github.com/seata/seata/releases/download/v$VERSION/$APP_NAME.tar.gz && \
    tar -zxvf $APP_NAME.tar.gz

FROM mcr.microsoft.com/java/jre:8u252-zulu-alpine

LABEL maintainer="<chaiyd.cn@gmail.com>"

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
RUN apk add tzdata dumb-init \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

ARG VERSION=1.4.2
ENV APP_NAME=seata-server-$VERSION

COPY --from=builder /seata /
#ADD registry.conf /$APP_NAME/conf/

WORKDIR $APP_NAME
EXPOSE 8091

CMD ["sh", "-c", "./bin/seata-server.sh"]