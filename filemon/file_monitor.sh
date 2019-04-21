#!/bin/bash

current_time="$(date '+%m-%d-%y %R:%S')"

if [ -f $1 ]; then
   echo ${current_time}" - File \"$1\" has been found" >> ~/testlog.txt
else
   echo ${current_time}" - File \"$1\" has been lost" >> ~/testlog.txt
fi
