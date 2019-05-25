#!/usr/bin/env python

import sys
import re

from collections import defaultdict

logFile = open(sys.argv[1], "r")

fromDict = defaultdict(int)
fromCount = 0
toDict = defaultdict(int)
toCount = 0 

emailRegex = re.compile(r'\w+=<\S+@\S+>')

for line in logFile:
    for match in re.findall(emailRegex, line):
        field = re.split(r'=', match)
        if field[0] == 'from':
            fromDict[field[1]] += 1
        if field[0] == 'to':
            toDict[field[1]] += 1

inverseFrom = [(value, key) for key, value in fromDict.items()]
inverseTo = [(value, key) for key, value in toDict.items()]

fivefrom = []
fivefromval = []
fiveto = []
fivetoval = []
for key in sorted(fromDict, key=fromDict.get, reverse=True)[:5]:
    fivefrom.append(str(key)) 
    fivefromval.append(fromDict[key])
for key in sorted(toDict, key=toDict.get, reverse=True)[:5]:
    fiveto.append(str(key))
    fivetoval.append(toDict[key])

for i, j in zip(fivefrom, fivefromval):
    print('From',i,j)

for i, j in zip(fiveto, fivetoval):
    print('To',i,j)
