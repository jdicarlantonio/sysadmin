#!/usr/bin/env python

import re
import sys

amavisQuar = 0
postfixReject = 0

logFile = open(sys.argv[1], "r")
hourlyInfo = open("hourlyInfo", "w")

minute = '00'
for line in logFile:
    test = re.split(r' ', line)
    if bool(re.match(r'\w+', test[0])):
        field = re.split(r' ', line)
        time = re.split(r':', field[3])

    if(minute == time[1]):
        if 'postfix' and 'reject' in line:
            postfixReject += 1
        if 'amavis' and 'Not-Delivered' in line:
            amavisQuar += 1
    else:
        text = test[0] +  ' ' + test[2] + ' ' + field[3] + ' ' + '[postfix rejects:' + str(postfixReject) + '] [amavis quarantines:' + str(amavisQuar) + ']\n'
        hourlyInfo.write(text)
        minute = time[1]


