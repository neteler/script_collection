#!/bin/sh

# Markus Neteler, 2006
# merge SHAPE files

PROG=`basename $0`

if [ $# -lt 1 ] ; then
 echo "Merges adjacent SHAPE files together (mosaik)"
 echo "Usage:"
 echo "  $PROG *.shp"
 echo "  $PROG a.shp b.shp c.shp"
 echo "At then end of the merge you will be asked to specify a new name for the resulting SHAPE file"
 exit 1
fi

LIST="$@"
OUT=file_merged

rm -f $OUT.shp

ogr2ogr $OUT.shp $1
shift

for i in `seq 1 $#` ; do
  echo "Appending #$i: $1"
  ogr2ogr -update -append $OUT.shp $1 -nln $OUT `basename $1 .shp`
  shift
done

echo "Written: $OUT.shp"

echo -n "Enter file name for new SHAPE (or CTRL-C): "
read NEW
NEW=`basename $NEW .shp`
mv $OUT.prj $NEW.prj
mv $OUT.dbf $NEW.dbf
mv $OUT.shx $NEW.shx
mv $OUT.shp $NEW.shp

echo "Written as: $NEW.shp"
