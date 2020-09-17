#!/bin/bash
hostList=$(nslookup jmeter-slaves-service | sed -n '/Name:/{x;n;p;d;}; x' | awk '{print $2":10101"}' |paste -sd ",")
jmeter.sh -n -Dserver.rmi.ssl.disable=true -t /atomicIntegerTest.jmx -l /test.jtl -e -o /HTML/ -j test.log $@ -R $hostList