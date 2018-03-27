#!/bin/sh

# MN $Date: 2004/08/09 20:38:35 $
# EPS -> svg vector (for OpenOffice, PPT etc)

############ notes
#  
#  http://www.pstoedit.net/pstoedit/

if [ $# -eq 0 -o "$1" = "help" -o "$1" = "-h" -o "$1" = "-help" ] ; then

  echo "EPS -> svg vector (for OpenOffice, PPT etc)"
  echo "Usage:"
  echo "       eps2svg.sh blabla.eps"
  exit 1
fi

INPUT=`echo $1 | sed 's+eps$++g' | sed 's+EPS$++g'`

### pstoedit -f svg ${INPUT}eps ${INPUT}svg

inkscape  ${INPUT}eps -l ${INPUT}svg

echo Written ${INPUT}svg

