 FILE=Consumer
# 开启集群模式消费
 ENABLE_BROADCAST=false

if [ $# -lt 1 ]
then
  echo "无参数，使用默认值"
# 消费者并发线程数
  THREAD_COUNT=64
else
  THREAD_COUNT=$1
fi

# rocketmq namesrv address，更改为您的 nameserver 地址
 NAMESRV_ADDR="48.48.0.14:9876;48.48.0.20:9876"
# rocketmq topic，确保您的是 TP_LOADTEST_COMMON
 TOPIC="BenchmarkTest"
# rocketmq groupId，确保您的是 GID_LOADTEST_COMMON
 GROUPID="benchmark_consumer"

java -Xms4g -Xmx4g -Xmn2g -jar ../lib/loadtest-1.0-SNAPSHOT-executable.jar -x ${FILE} -n ${NAMESRV_ADDR} -t ${TOPIC} -g ${GROUPID} -b ${ENABLE_BROADCAST} -c ${THREAD_COUNT}

# 更改 JVM 参数使用以下命令
# java -Xms8g -Xmx8g -Xmn4g -jar ../lib/loadtest-1.0-SNAPSHOT-executable.jar -x ${FILE} -n ${NAMESRV_ADDR} -t ${TOPIC} -g ${GROUPID} -b ${ENABLE_BROADCAST} -c ${THREAD_COUNT}
