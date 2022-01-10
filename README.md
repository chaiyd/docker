# docker

![]( https://visitor-badge.glitch.me/badge?page_id=chaiyd)

## docker-compose
```
version: '3.9'

services:
  web:
    container_name: web
    image: web:0.1
    restart: always
    ports:
      - "8080:8080"
    volumes:
      - ./data:/data    
    deploy:
      resources:
        limits:
          cpus: '2'
          memory: 1G
        reservations:
          cpus: '1'
          memory: 300M
          #devices:
          #- driver: nvidia
          #  device_ids: ['0', '3']
          #  capabilities: [gpu]

    #depends_on:
    #  - mysql
    environment:
      - JAVA_OPTS=-server -Xms300m -Xmx800m
```

## EMail
- chaiyd.cn@gmail.com

## [github](https://github.com/chaiyd/docker.git)
- docker images 仓库 
- docker hub http://hub.docker.com/u/chaiyd
- 此仓库与[docker hub](https://hub.docker.com/u/chaiyd)关联，进行自动构建
- 仓库中会存在一些早期dockerfile，在慢慢的更新维护中。

## [mysql](https://github.com/chaiyd/docker/tree/master/mysql)
- mysql 8.0
- 根据官方MySQL二次打包
  - update mysql_native_password
  - Time Zone Asia/Shanghai

## [kafka](https://github.com/chaiyd/docker/tree/master/kafka)
- Apache Kafka is an open-source distributed event streaming platform used by thousands of companies for high-performance data pipelines, streaming analytics, data integration, and mission-critical applications.

## [yearning](https://github.com/chaiyd/docker/tree/master/yearning)
- Yearning MYSQL SQL语句审核平台。提供查询审计，SQL审核等多种功能

## [rocketmq](https://github.com/chaiyd/docker/tree/master/rocketmq)
- Apache RocketMQ™ is a unified messaging engine, lightweight data processing platform.

## [gitlab](https://github.com/chaiyd/docker/tree/master/gitlab)
- docker-compose 配置ldap，邮箱等

## [openldap](https://github.com/chaiyd/docker/tree/master/openldap)
- docker-compose 编排ldap相关服务
- openldap、phpldapadmin、self-service-password

## [gocron](https://github.com/chaiyd/docker/tree/master/gocron)
- 使用Go语言开发的轻量级定时任务集中调度和管理系统, 用于替代Linux-crontab

## [mm-wiki](https://github.com/chaiyd/docker/tree/master/mm-wiki)
- MM-Wiki 是一个轻量级的企业知识分享与团队协同软件，可用于快速构建企业 Wiki 和团队知识分享平台。部署方便，使用简单，帮助团队构建一个信息共享、文档管理的协作环境。

## [wkcrm](https://github.com/chaiyd/docker/tree/master/wkcrm)
- 悟空CRM
- spring-java

## [seata](https://github.com/chaiyd/docker/tree/master/seata)
- https://github.com/seata/seata.git
- Seata 是一款开源的分布式事务解决方案，致力于在微服务架构下提供高性能和简单易用的分布式事务服务。

## [sentinel](https://github.com/chaiyd/docker/tree/master/sentinel)
- https://github.com/seata/seata.git
- sentinel 是一款开源的分布式事务解决方案，致力于在微服务架构下提供高性能和简单易用的分布式事务服务。

## [skywalking](https://github.com/chaiyd/docker/tree/master/skywalking)
- mcr.microsoft.com/java/jdk:8-zulu-alpine
- skywalking-agent-8.6.0

---
## 旧工程
- 很长时间未更新，后续有时间后，会逐渐更新
- 不再维护，将于近期删除
## [tomcat](https://github.com/chaiyd/docker/tree/master/tomcat)
- tomcat-centos
    - centos
- tomcat-alpine
    - alpine
