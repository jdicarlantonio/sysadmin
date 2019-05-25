#!/usr/bin/env python

import re
import operator

from collections import defaultdict

logFile = open("log2", "r")

knownIp = defaultdict(int)
unknownIp = defaultdict(int)
known = 0
unknown = 0

for line in logFile:
    if 'postfix' and 'connect' and not 'reject' in line:
        field = line.split(' ')
        if(len(field) > 4):
            if 'connect' in field:
                ip = field[len(field) - 1]
                ipAddr = ip.split('[')[-1].split(']')[0]
                if 'unknown' in ip:
                    unknownIp[ipAddr] += 1
                    unknown += 1
                else:
                    knownIp[ipAddr] += 1
                    known += 1

maxKnown = sorted(knownIp, key=knownIp.get, reverse=True)[:1]
maxUnknown = sorted(unknownIp, key=unknownIp.get, reverse=True)[:1]

print('Total Known connection:', known, '- [' + maxKnown[0] + '] accounts for',knownIp[maxKnown[0]], 'connections')
print('Total Unknown connection:', unknown, '- [' + maxUnknown[0] + '] accounts for',unknownIp[maxUnknown[0]], 'connections')
