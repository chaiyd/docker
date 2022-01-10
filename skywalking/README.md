## skywalking-agent
- https://github.com/chaiyd/docker/tree/master/skywalking
- mcr.microsoft.com/java/jdk:8-zulu-alpine
- skywalking-agent

### BUILD
```shell
FROM chaiyd/skywalking-agent:8.6.0

ADD JAR /home/

docker build --build-arg APP=APP -t APP:tag .
```

### ENV
```shell
skywalking=-javaagent:/home/agent/skywalking-agent.jar -Dskywalking.collector.backend_service=upp-skywalking-oap:11800
JAVA_OPTS=-Xms256m -Xmx1024m -Duser.timezone=Asia/Shanghai -Dfile.encoding=UTF-8
```

### skywalking kubernetes yaml
- https://github.com/chaiyd/kubernetes.git