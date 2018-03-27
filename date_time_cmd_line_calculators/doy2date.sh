#!/bin/sh

# Markus Neteler 2010
# DOY -> DAY 

if [ "$1" = "-h" -o "$1" = "-help" -o "$1" = "--help" ] ; then
   echo ""
   echo "$0 year doy"
   echo ""
   echo "Output:"
   echo "   date"
   exit 1
fi

if [ $# -eq 2 ] ; then
    YEAR=$1
    DOY=`echo $2 | awk '{printf "%d\n",$1}'`
else
   echo "Usage: $0 year doy"
   echo ""
   echo "Output:"
   echo "   date"
   exit 1
fi

# check leap year
isleapyear=`is_leap_year.sh $YEAR`
if [ $isleapyear -eq 0 ] ; then
    # no
    FLAG=" "
else
    # yes
    FLAG=" -l "
fi


# do the rest
RESULT=`month2day.sh $FLAG | grep ":$DOY$"`
DAY=`echo "$RESULT" | cut -d':' -f2 | awk '{printf "%02d\n", $1}'`
MON=`echo "$RESULT" | cut -d':' -f1 | awk '{printf "%02d\n", $1}'`
echo "${YEAR}-${MON}-${DAY}"


