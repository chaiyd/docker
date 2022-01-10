FROM mysql:8.0.25

LABEL maintainer="Docker Maintainers <chaiyd.cn@gmail.com>"

#更改时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ADD conf.d /etc/mysql/conf.d/