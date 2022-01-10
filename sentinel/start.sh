#!/bin/sh
jar=`ls -l | grep jar |awk '{print $NF}'`

exec java $JAVA_OPTS  -jar $jar