 FILE=Consumer
# 开启广播模式消费
 ENABLE_BROADCAST=true

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

# 消费位点
 CONSUME_FROM_WHERE="CONSUME_FROM_FIRST_OFFSET" # 从历史消息开始消费
# CONSUME_FROM_WHERE="CONSUME_FROM_LAST_OFFSET" # 从最新位置开始消费

java -Xms4g -Xmx4g -Xmn2g -jar ../lib/loadtest-1.0-SNAPSHOT-executable.jar -x ${FILE} -n ${NAMESRV_ADDR} -t ${TOPIC} -g ${GROUPID} -b ${ENABLE_BROADCAST} -w ${CONSUME_FROM_WHERE} -c ${THREAD_COUNT}

# 更改 JVM 参数使用以下命令
# java -Xms8g -Xmx8g -Xmn4g -jar ../lib/loadtest-1.0-SNAPSHOT-executable.jar -x ${FILE} -n ${NAMESRV_ADDR} -t ${TOPIC} -g ${GROUPID} -b ${ENABLE_BROADCAST} -w ${CONSUME_FROM_WHERE} -c ${THREAD_COUNT}
