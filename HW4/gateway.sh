#!/bin/sh 

ip route | grep 'default' | awk 'BEGIN {ORS=" "} {print "gateway: "$3}' 
ifconfig | grep 'Bcast' | cut -d: -f4 | awk 'BEGIN {ORS=" "} {print "netmask: " $1}' 
ip route | grep 'default' | awk '{print "device: " $5}'
