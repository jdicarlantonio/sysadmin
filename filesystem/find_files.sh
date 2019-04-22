#!/bin/bash

echo 'finding directories in /bin/, /sbin/, /usr/bin/, and /usr/sbin/ that are setuid and owned by root'
read -p "Hit any key to continue."
find /bin/ -user root -perm -4000
find /sbin/ -user root -perm -4000
find /usr/bin/ -user root -perm -4000
find /usr/sbin/ -user root -perm -4000
echo 'finding all files in system that have setuid or setgid enabled'
read -p "Hit any key to continue."
find / -perm -4000 ; find / -perm -2000
echo 'finding all files in /var/ that have been changed in the last 20 minutes'
read -p "Hit any key to continue."
find /var/ -cmin -20
echo 'finding all files in /var/ that have a zero length'
read -p "Hit any key to continue."
find /var/ -size 0
echo 'finding all files in /dev/ that are not regular files or directories displaying permissions and modification times'
read -p "Hit any key to continue."
find /dev/ -type b -exec ls -l {} \;
find /dev/ -type c -exec ls -l {} \; 
find /dev/ -type p -exec ls -l {} \;
find /dev/ -type l -exec ls -l {} \;
find /dev/ -type s -exec ls -l {} \;
echo 'finding all directories in /home/ not owned by root and changing permissions to 711'
read -p "Hit any key to continue."
find /home/ -type d \! -user root -exec chmod 711 {} \;
echo 'finding all regular files in /home/ not owned by root and changing permissions to 755'
read -p "Hit any key to continue."
find /home/ -type f \! -user root -exec chmod 755 {} \;
echo 'find all files in /etc/ that have changed in the last 5 days'
read -p "Hit any key to continue."
find /etc/ -ctime -5
