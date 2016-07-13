#! /bin/bash

if [[ $MESOS_SLAVE && ${MESOS_SLAVE} ]]
then
    mesos-slave --master=$MASTER --work_dir=/var/lib/mesos
else
    mesos-master --zk=$ZOOKEEPERS --work_dir=/var/lib/mesos --quorum=$QUOARM --ip=127.0.0.1
fi
