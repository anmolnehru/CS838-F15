ssh vm-1 "sudo sh -c \"sync; echo 3 > /proc/sys/vm/drop_caches\""
ssh vm-2 "sudo sh -c \"sync; echo 3 > /proc/sys/vm/drop_caches\""
ssh vm-3 "sudo sh -c \"sync; echo 3 > /proc/sys/vm/drop_caches\""
ssh vm-4 "sudo sh -c \"sync; echo 3 > /proc/sys/vm/drop_caches\""

ssh vm-1 "rm -rf $SPARK_LOCAL_DIRS/*"
ssh vm-2 "rm -rf $SPARK_LOCAL_DIRS/*"
ssh vm-3 "rm -rf $SPARK_LOCAL_DIRS/*"
ssh vm-4 "rm -rf $SPARK_LOCAL_DIRS/*"

ssh vm-1 "rm -rf /home/ubuntu/storage/logs/*"

stop-thriftserver.sh

start-thriftserver.sh --master spark://10.0.1.23:7077 --driver-memory 1g --conf spark.eventLog.enabled=true --conf spark.eventLog.dir=/home/ubuntu/storage/logs --conf spark.executor.memory=21000m --conf spark.executor.cores=4 --conf spark.task.cpus=1 &

