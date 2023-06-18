#!/bin/bash

# MN 2023
# fix destroyed file timestamps from EXIF

for MYFILE in $(ls IMG_*.jpg IMG_*.JPG IMG_*.png Screenshot_*.png Screenshot_*.jpg VID_* ) ; do

  echo "Processing $MYFILE ..."
  PARSEDATE="$(exiftool -DateTimeOriginal ${MYFILE} | cut -d':' -f2- | sed 's+^ ++g' | tr ' ' 'T' | tr -s ':' '-' | sed "s/./:/14" | sed "s/./:/17")"

  echo "Using <${PARSEDATE}>"
  touch -d "${PARSEDATE}" ${MYFILE}
done
