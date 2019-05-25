#!/bin/sh 

ip route | grep 'default' | awk 'BEGIN {ORS=" "} {print "gateway: "$3}' 
ifconfig | grep 'broadcast' | cut -d: -f4 | awk 'BEGIN {ORS=" "} {print "netmask: " $4}' 
ip route | grep 'default' | awk '{print "device: " $5}'
