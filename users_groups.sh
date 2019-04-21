#!/bin/bash

# need to use redirection to eliminate string output from wc -l
numUsers=$(wc -l < /etc/passwd)

for ((i = 1; i <= $numUsers; ++i)) do
    # print user and UID
    awk -v current="$i" -F":" 'BEGIN{ORS=""} NR==current{print $1, $3}' /etc/passwd
    
    # store the current user in a variable
    user=$(awk -v current="$i" -F":" 'BEGIN{ORS=""} NR==current{print $1}' /etc/passwd)
   
    # store output of groups command in an array 
    groupsArray=($(groups $user))
    arrayLength=${#groupsArray[@]} 

    # loop through the group array starting at the third word, this should be 
    # the start of the user groups
    for((j = 2; j < ${arrayLength}; ++j)) do
        printf " %s" ${groupsArray[j]}
    done
    
    printf "\n"

done


