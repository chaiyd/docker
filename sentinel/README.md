## sentinel
- https://github.com/chaiyd/docker.git
### doc
- https://github.com/alibaba/Sentinel.git

### docker-compose
```yaml
version: '3'

services:
  sentinel:
    container_name: sentinel
    image: chaiyd/sentinel:1.8.1
    restart: always
    environment:
      - JAVA_OPTS=-Xms256m -Xmx512m -Duser.timezone=Asia/Shanghai
    ports:
      - "8080:8080"

```
