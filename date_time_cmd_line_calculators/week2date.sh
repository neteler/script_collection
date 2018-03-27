#!/bin/sh

# Markus Neteler 2009
# for a given year, it prints all Mondays (except for first day of year), week numbers, and DOY

if [ "$1" = "-h" -o "$1" = "-help" -o "$1" = "--help" ] ; then
   echo ""
   echo "$0 year"
   echo ""
   echo "Output:"
   echo "   date week DOY"
   exit 1
fi

if [ $# -eq 1 ] ; then
    YEAR=$1
else
   echo "Usage: $0 year"
   echo ""
   echo "Output:"
   echo "   date week DOY"
   exit 1
fi

# catch first (incomplete) week
date -d "${YEAR}-01-01 CET 0 days" +"%Y-%m-%d %V (%j)"

# DOY of last day
# check leap year
isleapyear=`is_leap_year.sh $YEAR`
if [ $isleapyear -eq 0 ] ; then
    # no
    LASTDAY=365
else
    # yes
    LASTDAY=366
fi


# do the rest
for d in `seq 1 $LASTDAY` ; do  date -d "${YEAR}-01-01 CET $d days" +"%Y-%m-%d %u %V (%j)"; done | grep ' 1 ' | cut -d' ' -f1,3,4

