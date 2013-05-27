#! /bin/sh

DEFAULT_SESSION=i3
case $1 in
    kde)     exec startkde;;
    i3)      exec i3;;
    *)       exec $DEFAULT_SESSION;;
esac
