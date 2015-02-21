#!/usr/bin/env bash
set -x

alter_config(){
  sed -i "$1" /opt/zookeeper-$ZK_VER/conf/zoo.cfg
}

ZOO_LOG_DIR=${ZOO_LOG_DIR:-"/var/log/zookeeper"}
ZOO_LOG4J_PROP=${ZOO_LOG4J_PROP:-"DEBUG,ROLLINGFILE"}
SERVER_JVMFLAGS=${SERVER_JVMFLAGS:-""} # additional JVM server flags
JVM_HEAP_MEMORY=${JVM_HEAP_MEMORY:-"1g"}

#Using -Xloggc automatically sets -XX:+PrintGC and -XX:+PrintGCTimeStamps flags
SERVER_JVMFLAGS="-Xms${JVM_HEAP_MEMORY} -Xmx${JVM_HEAP_MEMORY} -XX:+UseG1GC -Xloggc:${ZOO_LOG_DIR}/gc.log ${SERVER_JVMFLAGS}"

ZK_CLIENT_PORT=${ZK_CLIENT_PORT:-"2181"}

alter_config "s/clientPort=.*/clientPort=$ZK_CLIENT_PORT/g"

echo "Using JVM server flags: ${SERVER_JVMFLAGS}"

export SERVER_JVMFLAGS
export ZOO_LOG_DIR
export ZOO_LOG_DIR

bash /opt/zookeeper-$ZK_VER/bin/zkServer.sh start-foreground
