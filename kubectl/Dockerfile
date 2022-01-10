FROM alpine:3.15

LABEL maintainer="chaiyd <chaiyd.cn@gmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update  \
    && apk add --no-cache supervisor tzdata dumb-init \
    && cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ARG KUBECTL_VER=v1.20.11

RUN wget -c https://dl.k8s.io/release/${KUBECTL_VER}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

ADD supervisord.ini /etc/supervisor.d/
#ADD config /root/.kube/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]
