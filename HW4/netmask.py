#!/usr/bin/env python3

import sys

netmask = [255, 255, 255, 255]

nBits = sys.argv[1]
addr = pow(2, 32 - int(nBits))
usableAddr = addr - 2
hostBits = 32 - int(nBits)

for i in range(0, 8):
    if hostBits != 0:
        netmask[3] -= pow(2, i)
        hostBits -= 1;
    else:
        break

if hostBits != 0:
    for i in range(0, 8):
        if hostBits != 0:
            netmask[2] -= pow(2, i)
            hostBits -= 1;
        else:
            break

if hostBits != 0:
    for i in range(0, 8):
        if hostBits != 0:
            netmask[1] -= pow(2, i)
            hostBits -= 1;
        else:
            break

if hostBits != 0:
    for i in range(0, 8):
        if hostBits != 0:
            netmask[0] -= pow(2, i)
            hostBits -= 1;
        else:
            break

print("addresses:", addr, "usable:", usableAddr, "netmask:", netmask[0], netmask[1], netmask[2], netmask[3])
