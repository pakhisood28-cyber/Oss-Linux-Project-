#!/bin/bash

dirs=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "system directory audit report"

for d in "${dirs[@]}"
do
    if [ -d "$d" ]
    then
        perms=$(ls -ld "$d" | awk '{print $1, $3, $4}')
        size=$(du -sh "$d" 2>/dev/null | cut -f1)

        echo "$d -> perms: $perms | size: $size"
    else
        echo "$d not exist"
    fi
done

echo "checking git config..."

git_conf="/etc/gitconfig"

if [ -f "$git_conf" ]
then
    p=$(ls -l "$git_conf" | awk '{print $1}')
    echo "git config found at $git_conf"
    echo "perms: $p"
else
    local_git="$HOME/.gitconfig"

    if [ -f "$local_git" ]
    then
        p2=$(ls -l "$local_git" | awk '{print $1}')
        echo "local git config found"
        echo "perms: $p2"
    else
        echo "no git config file found"
    fi
fi