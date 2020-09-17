#!/bin/bash

export timestamp=$(date +%Y%m%d_%H%M%S) && \
export jmeter_path=/ && \
docker run \
  --volume ${pwd}:${jmeter_path} \
  --network jmeter-network \
  jmeter-master \
  -n  \
  -Dserver.rmi.ssl.disable=true \
  -t ${jmeter_path}/atomicIntegerTest.jmx \
  -l ${jmeter_path}/ExecutionResults/result_${timestamp}.jtl \
  -j ${jmeter_path}/ExecutionResults/jmeter_${timestamp}.log \
  -R 172.21.0.2:10101
