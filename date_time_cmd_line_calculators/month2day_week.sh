#!/bin/sh

# Markus Neteler 2012, 2013
# split annual calendar into weeks
# extra parameter for CDC epidemiological week, http://www.cmmcp.org/epiweek.htm

if [ "$1" = "-h" -o "$1" = "-help" -o "$1" = "--help" -o $# -gt 3 -o $# -lt 1 ] ; then
   echo ""
   echo "$0 year [filenamepattern] [epiweek]"
   echo ""
   echo "Usage:"
   echo "  $0 2008 "
   echo "  $0 2008 lst_YYYY_DOY_average"
   echo "  $0 2008 lst_YYYY_DOY_average epiweek"
   exit 1
fi

YEAR=$1
FILEPAT=$2
EPIWEEK=$3

##### nothing to change below ##########
# DOY of last day
# check leap year
isleapyear=`is_leap_year.sh $YEAR`
if [ $isleapyear -eq 0 ] ; then
    # no
    DOYLAST=365
else
    # yes
    DOYLAST=366
fi
#echo $DOYLAST

# list all dates with DOY
for d in `seq 1 $DOYLAST` ; do

  #       %j     day of year (001..366)
  #       %u     day of week (1..7); 1 is Monday
  #       %W     week number of year, with Monday as first day of week (00..53)
  #       %U     week number of year, with Sunday as first day of week (00..53)

  if test "$EPIWEEK" = "" ; then
    # US notion: now Sunday is the first day etc.
    DATESTRING=`date -d "${YEAR}-01-01 CET $d days" +"%Y_%j %U"`
    echo "This is probably all wrong... :(( "
  else
    # date has an offset by 1:
    d=`expr $d - 1`
    # use European & ISO notion
    DATESTRING=`date -d "${YEAR}-01-01 CET $d days" +"%Y_%j %W"`
  fi
  # 2008_352 50
  YEAR_DATE=`echo $DATESTRING | cut -d' ' -f1`
  WEEKNO=`echo $DATESTRING | cut -d' ' -f2`
  echo "$FILEPAT $WEEKNO" | sed "s+YYYY_DOY+$YEAR_DATE+g"
done
