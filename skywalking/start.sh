#!/bin/sh
jar=`ls -l | grep jar |awk '{print $NF}'`

exec java -Dskywalking.agent.service_name=$APP_NAME $skywalking $JAVA_OPTS  -jar $jar