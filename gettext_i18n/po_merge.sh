#!/bin/sh

# Markus Neteler 2006

MSGMERGE="msgmerge -N --no-wrap"

if [ $# -gt 0 ] ; then
 echo "Script to merge GRASS .po files into existing .po files"
 echo "for use in GRASS:"
 echo "1. store received .po files into your HOME (libs, mods, tcl, ... or just a subset or single file)"
 echo "2. cd locale/po/"
 echo "3. po_merge.sh  # the script will ask you for the country code (de, lv, ja, ...)"
 echo "The script will then take from HOME the .po file(s) and merge them into the respective po files in locale/po/"
 echo "Check with"
 echo "cd ../ ; make"
 exit 1
fi

echo -n "Language (de, lv, ja, pt_br, ...)?: "
read MYLANG

echo "grasstcl_${MYLANG}.po"
$MSGMERGE ~/grasstcl_${MYLANG}.po grasstcl_${MYLANG}.po -o grasstcl_${MYLANG}.po2 &&  mv grasstcl_${MYLANG}.po2 grasstcl_${MYLANG}.po
echo "grassmods_${MYLANG}.po"
$MSGMERGE ~/grassmods_${MYLANG}.po grassmods_${MYLANG}.po -o grassmods_${MYLANG}.po2 &&  mv grassmods_${MYLANG}.po2 grassmods_${MYLANG}.po
echo "grasslibs_${MYLANG}.po"
$MSGMERGE ~/grasslibs_${MYLANG}.po grasslibs_${MYLANG}.po -o grasslibs_${MYLANG}.po2 &&  mv grasslibs_${MYLANG}.po2 grasslibs_${MYLANG}.po
echo "grasswxpy_${MYLANG}.po"
$MSGMERGE ~/grasswxpy_${MYLANG}.po grasswxpy_${MYLANG}.po -o grasswxpy_${MYLANG}.po2 &&  mv grasswxpy_${MYLANG}.po2 grasswxpy_${MYLANG}.po  
echo "grassnviz_${MYLANG}.po"
$MSGMERGE ~/grassnviz_${MYLANG}.po grassnviz_${MYLANG}.po -o grassnviz_${MYLANG}.po2 &&  mv grassnviz_${MYLANG}.po2 grassnviz_${MYLANG}.po

