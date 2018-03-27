#!/bin/sh

# rotate EPS file

FILE=$1
SUBFILE=`basename $FILE .eps`
NEW="${SUBFILE}_rot.eps"

BBOX=`head -10 "$1" | grep '%%BoundingBox: ' | cut -d' ' -f2-`

epsffit -r ${BBOX} $FILE $NEW

echo "Written $NEW"

exit 0
