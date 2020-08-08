export MASTER_HADOOP_HOME=/home/wangchen/Desktop/hadoop/master/tmp
export SLAVE1_HADOOP_HOME=/home/wangchen/Desktop/hadoop/slave1/tmp
export SLAVE2_HADOOP_HOME=/home/wangchen/Desktop/hadoop/slave2/tmp

docker run --name master --network hadoopnet --ip 172.18.0.2 -dit -v ${MASTER_HADOOP_HOME}:/hadoop/tmp --privileged hadoop_cluster

docker run --name slave1 --network hadoopnet --ip 172.18.0.3 -dit -v ${SLAVE1_HADOOP_HOME}:/hadoop/tmp --privileged hadoop_cluster

docker run --name slave2 --network hadoopnet --ip 172.18.0.4 -dit -v ${SLAVE2_HADOOP_HOME}:/hadoop/tmp --privileged hadoop_cluster
