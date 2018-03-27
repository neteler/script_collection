#!/bin/sh

# Purpose: simple script to find big files in directory tree)
# 
# Author:  Markus Neteler, 2007

# Source:
#  http://susefaq.sourceforge.net/oneliner.html
#     1. How can I locate the biggest files to see what is eating the space ?

#SIZE="+10000k"
if [ $# -gt 0 ] ; then
   SIZE=+$1
else
   SIZE="+50000"
fi

echo "Searching here and in subdirs for file > $SIZE ..."
# find . -xdev -type f -size $SIZE -mtime -3 -ls | sort -n -k 7,7
find . -xdev -type f -size $SIZE -ls | sort -n -k 7,7
