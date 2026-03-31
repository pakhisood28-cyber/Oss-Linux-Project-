#!/bin/bash

logfile=$1
keyword=${2:-error}
count=0

# check file
if [ -z "$logfile" ]
then
    echo "usage: $0 <logfile> [keyword]"
    exit 1
fi

if [ ! -f "$logfile" ]
then
    echo "file not found: $logfile"
    exit 1
fi

# wait if empty
while [ ! -s "$logfile" ]
do
    echo "file empty, waiting..."
    sleep 2
done

echo "checking $logfile for $keyword"

# read file line by line
while IFS= read -r line
do
    if echo "$line" | grep -iq "$keyword"
    then
        count=$((count+1))
    fi
done < "$logfile"

echo "done"
echo "total $keyword found: $count"

# last few lines
if [ $count -gt 0 ]
then
    echo "last 5 lines:"
    grep -i "$keyword" "$logfile" | tail -n 5
fi