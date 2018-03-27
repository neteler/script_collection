#!/bin/sh

# Markus Neteler
# check if a year is a leap year

# based on 
# http://www.cs.adelaide.edu.au/docs/gnu/gawk-3.0.3/html_node/gawk_147.html
# http://en.wikipedia.org/wiki/Leap_year

if [ $# -ne 1 ] ; then
 echo "Usage: $0 year"
 exit 1
else
 YEAR=$1
fi

# setting environment, so that awk works properly in all languages
unset LC_ALL
LC_NUMERIC=C
export LC_NUMERIC


# decide if a year is a leap year
echo $YEAR | awk 'BEGIN {}
function _tm_isleap(year,    ret)
{
    ret = (year % 4 == 0 && year % 100 != 0) ||
            (year % 400 == 0)

    return ret
}
{ret=_tm_isleap($1)}
END{
print ret
}'

