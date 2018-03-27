#!/usr/bin/env ksh

# Purpose: simple script to find files in a specific date range
# 
# Author:  Markus Neteler, 2007


## http://www.unix.com/aix/178017-copy-files-particular-dates.html

touch -t 201307091753.00 marker.start    # bounds Feb 15 2012 midnight - Feb 16 23:59:59
touch -t 201307091755.59 marker.end

# cd to desired directory if needed, or enter full path instead of '.' in the find command 
find . -type f -newer marker.start  ! -newer marker.end   |while read file
do
    if [[ ${file%%.*} != "marker" ]]    # skip markers (assumes no files you want to copy start with marker.
    then
        ls -al "$file"            # demonstration/verification 
        # remove the ls command and replace with your copy command 
    fi
done
rm marker.start marker.end
