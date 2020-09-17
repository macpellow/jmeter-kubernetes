#!/usr/bin/env bash
export timestamp=$(date +%Y%m%d_%H%M%S)
export DISPLAY=:0
set -e
# generate host keys if not present

mkdir /opt/log/

freeMem=`awk '/MemFree/ { print int($2/1024) }' /proc/meminfo`
s=$(($freeMem/10*8))
x=$(($freeMem/10*8))
n=$(($freeMem/10*2))
export JVM_ARGS="-Xmn${n}m -Xms${s}m -Xmx${x}m"

echo "START Running Jmeter on `date`"
echo "JVM_ARGS=${JVM_ARGS}"
echo "jmeter args=$@"

#jmeter -n -s -Jserver_port=10101 -Jserver.rmi.localport=10102 -j /opt/log/jmeter_${timestamp}.log
jmeter $@