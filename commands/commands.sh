#!/bin/bash

# dd (data duplicator) copies a file and converts/formats based on the provided 
# operands
# from a sysadmin POV, this command is useful for making backups of disks
# this command will backup the contents of /dev/sda1 to a file called 
# sdaback.imgs
dd if=/dev/sda1 of=~/sdaback.img

# find will search for a file in a directory hierarchy
# to demonstrate, I am searching for all files with the .sh extension in the
# /lib/ directory. So all bash scripts in /lib/
find /lib/ -name "*.sh"

# using the file command determines the file type. It works by running a set
# of three tests: filesystem, magic, and language test. filesystem checks
# if empty, magic checks format, and language tests the language of the file
# here, i just use file to determine the file type of /dev/sda1
file /dev/sda1

# fuser will identify any processes that are using files or sockets
# here i use fuser to find which processes are using the pwd
fuser -v .

# grep is a command which searches for patterns. grep can be used with other
# commands using a pipe, for instance we can also find files with a certain
# pattern using grep.
# here i find information on the enp2s0 wireless driver by combining ifconfig 
# with grep and displaying only the first 4 lines
ifconfig | grep -A 4 enp2s0

# the host command looks up DNS, ie it finds the host of an IP or the IP address
# of a host. Here I just find the ip of the UCR homepage
host ucr.edu

# ldd shows the dependencies of shared object files. So if a program requires a
# shared object, this command will print all the shared objects it requires
# Here, i just list all the shared object files needed for gcc
ldd /bin/gcc

# lsof lists files that are open
# here i use lsof to see what processes have done any logging by using lsof on
# a directory. In this case D is /var/log
lsof +D /var/log/

# mount is used to mount a filesystem
# this command can be used to mount a CD or USB stick for usage
# here i just mount a USB 
mount /dev/sdb1 /mnt

# ps is used to see the current processes
# here we can show a full list of running processes
ps -e

# pkill is used to signal a process. In this example i make syslog reread its 
# config files, as shown in the man page for pkill
pkill -HUP syslogd

# netstat is used to print network connections, routing tables, interface stats,
# masquerage connections and multicast memberships
# Here i list all the TCP and UDP ports conncetions
netstat -atu

# renice changes the priority of a running process
# here i increase the niceness of root owned processes
renice +1 -u root

# rsync is a remote file-copying tool which copies files locally to another host
# remotely
# here i just copy a file to another directory in home
rsync testfile ~/testdir

# time shows the time spent running a command
# in this demonstration, i use the sleep command to create a process for a certain
# amount of time. From a sysadmin and/or developer POV, time could be used to 
# measure the runtime of a script and/or compile/run time of a program
time sleep 2

# ssh is used to connect to a remote server
# here i just connect to the ucr hammer server using my netid
ssh jdica001@hammer.ucr.edu

# stat displays the status of files of file systems
# stat can be used to see the status of the cpu file
stat /dev/cpu

# the strace command is used to trace system calls and signals of certain programs
# it can be used to trace any executable and thus any command
# Here i trace the netstat command above
strace netstat -atu

# uname prints information on the current ssytem
# for this demo i print the kernel name and release as well as the OS
uname -onr

# wget is used to download files from the web
# here i download the mainline kernel tarball
wget https://git.kernel.org/torvalds/t/linux-5.1-rc7.tar.gz
