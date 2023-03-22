#!/bin/sh
case $1 in
    1) exec st -e htop -s PERCENT_CPU ;;
esac
