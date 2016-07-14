#! /bin/bash

if [[ $MESOS_SLAVE && ${MESOS_SLAVE} ]]
then
    mesos-slave  --no-systemd_enable_support --work_dir=/var/lib/mesos --log_dir=/var/log/mesos $ARGS
else
    mesos-master --work_dir=/var/lib/mesos --ip=0.0.0.0 --log_dir=/var/log/mesos $ARGS
fi
