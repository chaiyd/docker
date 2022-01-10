# yapi

- https://github.com/chaiyd/docker.git

## yapi官方文档
- https://github.com/YMFE/yapi.git
- https://hellosean1025.github.io/yapi/


## 默认密码：ymfe.org
```yaml
version: '3'

services:
    yapi:
        image: chaiyd/yapi:0.1
        container_name: yapi
        # 第一次启动使用
        # command: "yapi server"
        # 之后使用下面的命令
        command: "node /my-yapi/vendors/server/app.js"
        volumes:
            - ./my-yapi:/my-yapi
        ports:
            - 9090:9090
            - 3000:3000
        depends_on:
            - mongo
        restart: always

    mongo:
        image: mongo:4.4.5
        container_name: mongo
        restart: always
        volumes:
            - ./mongo-conf:/docker-entrypoint-initdb.d
            - ./mongo/etc:/etc/mongo
            - ./mongo/data/db:/data/db
        #ports:
        #    - 27017:27017
        environment:
          MONGO_INITDB_ROOT_USERNAME: mongo
          MONGO_INITDB_ROOT_PASSWORD: example
          MONGO_INITDB_DATABASE: yapi
```
