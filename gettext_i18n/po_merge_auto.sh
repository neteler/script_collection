#!/bin/sh

# Markus Neteler 2006, 2011

MSGMERGE="msgmerge -N --no-wrap"

if [ $# -gt 0 ] ; then
 echo "Script to merge GRASS .po files into existing .po files"
 echo "for use in GRASS:"
 echo "1. store received .po files into your HOME (libs, mods, tcl or a subset)"
 echo "2. cd locale/po"
 echo "3. po_merge_auto.sh  # the script will loop over"
 echo "The script will take the .po file(s) from HOME and merge them into the existing files"
 exit 1
fi

for MYLANG in `ls -1 grasslibs_*.po | cut -d'_' -f2- | sed 's+\.po++g'` ; do

echo "grassmods_${MYLANG}.po"
$MSGMERGE ~/grassmods_${MYLANG}.po grassmods_${MYLANG}.po -o grassmods_${MYLANG}.po2 &&  mv grassmods_${MYLANG}.po2 grassmods_${MYLANG}.po
echo "grasslibs_${MYLANG}.po"
$MSGMERGE ~/grasslibs_${MYLANG}.po grasslibs_${MYLANG}.po -o grasslibs_${MYLANG}.po2 &&  mv grasslibs_${MYLANG}.po2 grasslibs_${MYLANG}.po
echo "grasswxpy_${MYLANG}.po"
$MSGMERGE ~/grasswxpy_${MYLANG}.po grasswxpy_${MYLANG}.po -o grasswxpy_${MYLANG}.po2 &&  mv grasswxpy_${MYLANG}.po2 grasswxpy_${MYLANG}.po  

done
