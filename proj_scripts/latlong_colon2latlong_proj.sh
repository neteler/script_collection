#!/bin/sh

# converts 10:31:19.73E -> 10d31'19.73E
# Markus Neteler 12/2002

if [ $# -lt 1 ] ; then
 echo "converts 10:31:19.73E -> 10d31'19.73E (PROJ notation)"
 echo latlong_colon2latlong_proj.sh CVSfile_with_space_separator.csv
 exit 1
fi

cat $1 | sed 's+:+d+1' | sed 's+:+d+2' | sed "s+:+'+1"| sed "s+:+'+1"

