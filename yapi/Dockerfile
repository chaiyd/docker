FROM node:12-alpine
MAINTAINER chaiyd.cn@gmail.com

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update  \
    && apk add --no-cache ca-certificates tzdata \
    && cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

RUN npm install -g yapi-cli --registry https://registry.npm.taobao.org

EXPOSE 3000 9090
VOLUME /my-yapi

#CMD ["yapi","server"]
