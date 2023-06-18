#!/bin/bash

# MN 2022
# fix destroyed file timestamps from filename

for MYFILE in $(ls IMG_*.jpg IMG_*.JPG IMG_*.png Screenshot_*.png Screenshot_*.jpg VID_* ) ; do

  echo "Processing $MYFILE ..."
  MYFILE2="$(echo ${MYFILE} | cut -d'.' -f1)"
  MYDATE="$(echo ${MYFILE2} | cut -d'_' -f2-3)"

  PARSEDATE="$(echo ${MYDATE} | sed 's/^..../&-/' | sed 's/^......./&-/' | sed 's/^............./&:/' | sed 's/^................/&:/' | tr '_' ' ')"

  echo "Using <${PARSEDATE}>"
  touch -d "${PARSEDATE}" ${MYFILE}
done
