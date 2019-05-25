#!/usr/bin/env python

import re
import sys

from collections import defaultdict

rejects = 0
uniqueIp = defaultdict(int)
fromDict = defaultdict(int)
toDict = defaultdict(int)

logFile = open('log4', "r")

ipRegex = re.compile(r'\d+\.\d+\.\d+\.\d+')
fromRegex = re.compile(r'from=<\S+@\S+>')
toRegex = re.compile(r'to=<\S+@\S+>')

for line in logFile:
    if 'dnsbl.sorbs.net' in line:
        rejects += 1
        
        ipMatch = re.findall(ipRegex, line)
        uniqueIp[str(ipMatch)] += 1

        fromMatch = re.findall(fromRegex, line)
        fromDict[str(fromMatch)] += 1
        
        toMatch = re.findall(toRegex, line)
        toDict[str(toMatch)] += 1

print(rejects, 'messages rejected')
print(len(uniqueIp), 'unique IP\'s')
print(len(fromDict), 'unique from addresses')
print(len(toDict), 'unique to addresses')
