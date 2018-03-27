#!/bin/sh

# Markus Neteler 2009
# take DATE, write DOY

if [ "$1" = "-h" -o "$1" = "-help" -o "$1" = "--help" -o $# -ne 1 ] ; then
   echo ""
   echo "$0 DATE"
   echo ""
   echo "Usage:"
   echo "  $0 2008-10-21"
   exit 1
fi

DATE=$1

date -d "$DATE" +"%j"
