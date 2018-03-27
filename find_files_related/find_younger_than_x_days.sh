#!/bin/sh

# Purpose: simple script to find files which are younger than X days (today and back for X days)
# 
# Author:  Markus Neteler, 2007

if [ $# -lt 1 ]
then
 echo "Usage: $0 days"
 exit
fi

find . -type f -mtime -$1
