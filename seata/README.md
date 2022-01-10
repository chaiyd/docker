## seata
- https://github.com/chaiyd/docker.git

### doc
- default use file
  - conf/registry.conf
- http://seata.io/zh-cn/docs/user/configuration/index.html

### docker-compose
```yaml
version: '3'

services:
  seata:
    container_name: seata
    image: chaiyd/seata:1.4.2
    restart: always
    volumes:
      - ./conf/registry.conf:/seata-server-1.4.2/conf/registry.conf
    ports:
      - "8091:8091"

```

### docker build
```dockerfile
FROM chaiyd/seata:1.4.2

ARG VERSION=1.4.2
ENV APP_NAME=seata-server-$VERSION

ADD conf/registry.conf /$APP_NAME/conf/
```