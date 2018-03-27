#!/bin/bash

# Markus Neteler, 2016
# Script to fix recursively directory timestamps by updating to latest modified file within
#
# Script runs recursively on current dir
#
# Note: empty directories will confuse this script.
# workaround - run beforehand: sh ~/markus_repo/scripts/find_empty_directories.sh
#
# BTW: Yes, it took 5h+ of work to develop this script.
###################

# setting environment, so that awk works properly in all languages
unset LC_ALL
LC_NUMERIC=C
export LC_NUMERIC

#########
MASTERDIR=`pwd`

# work around white space in path names
DIRLIST=`find . -type d | grep -v '^.$' | sed 's+^\./++g' | tr -s ' ' '|'`

# now sort by number of subdirectories
for mydir in $DIRLIST ; do
    NUMSUBDIRS=`echo "${mydir}" | grep -Foe "/" |  uniq -c | awk '{printf "%d\n", $1}'`
    echo "$NUMSUBDIRS ${mydir}"
done | sort -nr | cut -d' ' -f2 > /tmp/tmp_dirlist

# now loop through all, starting with the most nested subdir
for mydir in `cat /tmp/tmp_dirlist` ; do
  #echo "######## next round #######"
  # always go back to where we started
  cd ${MASTERDIR}
  
  # work around white space in path names
  mydir="`echo ${mydir} | sed 's+|+ +g'`"
  echo "Processing <$mydir>"
  cd "${mydir}"
  # find latest changed file
  #   skip broken links on the fly with: -not -xtype l
  NEWESTFILE="`find -mindepth 1 -maxdepth 1 -not -xtype l -printf '%T+=%p\n' | sort -n | tail -n 1 | cut -d= -f2-`"

  # now apply
  CURRDIR="`pwd`"
  # echo "We are in $CURRDIR"
  touch --reference="${NEWESTFILE}" "${CURRDIR}"
done

rm -f /tmp/tmp_dirlist

