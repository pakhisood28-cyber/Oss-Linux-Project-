#!/bin/bash

echo "answer few questions to make your manifesto"
echo ""

read -p "1. one open source tool you use daily: " tool
read -p "2. what freedom means (one word): " freedom
read -p "3. what you want to build and share: " build

date_now=$(date '+%d %B %Y')
user="pakhi"
file="manifesto_${user}.txt"

# writing to file
{
    echo "open source manifesto ($date_now)"
    echo ""
    echo "my name is $user and i like open source."
    echo "i use $tool almost everyday."
    echo "for me freedom means $freedom."
    echo ""
    echo "someday i will build $build and share with everyone."
    echo "because others also shared things for free."
} > "$file"

echo -n "making file"
for i in {1..3}
do
    echo -n "."
    sleep 0.5
done
echo " done"

echo "saved in $file"
echo ""

cat "$file"