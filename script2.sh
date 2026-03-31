#!/bin/bash

pkg="git"

echo "checking package $pkg..."

# check if installed
if pacman -Q $pkg &>/dev/null
then
    echo "$pkg is installed"

    # some basic info
    pacman -Qi $pkg | grep -E 'Version|URL|Installed Size'

else
    echo "$pkg not installed"
    echo "you can install using sudo pacman -S $pkg"
fi

# small info about package
case $pkg in
    "httpd"|"apache2")
        echo "apache is web server used widely on internet" ;;
    "mysql"|"mysql-server")
        echo "mysql is open source database used in many apps" ;;
    "git")
        echo "git made by linus when he needed version control" ;;
    "vlc")
        echo "vlc can play almost all media formats" ;;
    "firefox")
        echo "firefox is browser focused on open web" ;;
    *)
        echo "this package is part of foss world" ;;
esac