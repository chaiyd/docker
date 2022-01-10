FROM mcr.microsoft.com/java/jre:8u252-zulu-alpine

LABEL maintainer="Docker Maintainers <chaiyd.cn@gmail.com>"
#setting time zone
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add tzdata dumb-init \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata


ARG APP_PATH=/home/
ARG VERSION=1.8.1
ENV APP_NAME=sentinel-dashboard-$VERSION

WORKDIR $APP_PATH
RUN wget -c https://github.com/alibaba/Sentinel/releases/download/$VERSION/$APP_NAME.jar

#COPY agent $path/agent
COPY start.sh $APP_PATH

RUN chmod +x start.sh
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "-c", "./start.sh"]