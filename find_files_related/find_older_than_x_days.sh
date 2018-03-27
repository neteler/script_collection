#!/bin/sh

# Purpose: simple script to find files which are older than X days
# 
# Author:  Markus Neteler, 2007

if [ $# -lt 1 ]
then
 echo "Usage: find_older_than_x_days.sh days"
 exit
fi

find . -type f -mtime +$1
