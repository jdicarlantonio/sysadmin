#!/bin/bash

current_time="$(date '+%m-%d-%y %R:%S')"

if [ -f $1 ]; then
   echo ${current_time}" - File \"$1\" has been found" >> /var/log/cs183/uptime.log
else
   echo ${current_time}" - File \"$1\" has been lost" >>  /var/log/cs183/uptime.log
fi
