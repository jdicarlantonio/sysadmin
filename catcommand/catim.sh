#/bin/bash

if [ $# -lt 1 ]
then
    echo "Error: Expected arguments."
else
    args=("$@")
    for i in "${args[@]}" 
    do
        while read LINE
        do
            echo $LINE
        done < $i
    done
fi
