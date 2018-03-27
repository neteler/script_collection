#!/bin/bash

# in the current directory:
#  changes filenames/directories with white space 
#  to same names with underscores

# MN 2006
# from
#  http://lists.oregonstate.edu/pipermail/linux/2004-September/000632.html
#
# 2> /dev/null suppresses confusing error messages for files/dirs
#    without white space
#
# 2012: fix for links, ignore them
# 2016: /bin/sh --> /bin/bash

for i in *; do 
  if test -f "${i}" ; then
     mv "${i}" "${i// /_}" 2> /dev/null
  fi
done
