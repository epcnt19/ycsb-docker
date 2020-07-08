#!/bin/sh

type=$1
host=192.168.133.201

if [ $# -ne 1 ]
then
	echo "please give workload type (a to f)"
	exit 1
fi

echo "${type} is selected"

cd /opt/ycsb-0.17.0/
./bin/ycsb load memcached -s -P workloads/workload$type -p "memcached.hosts=${host}"
./bin/ycsb run memcached -s -P workloads/workload$type -p "memcached.hosts=${host}"
