#!/bin/sh

# Markus Neteler, 2016
# update timestamp of link to the source timestamp

if [ -z "$1" ] ; then
  echo 'ERROR: Parameter missing. specify the folder (. for current)!'
  exit
fi


for mylink in `find . -type l` ; do
  LINK="`namei ${mylink} | grep '^ l ' | tr -s ' ' ' ' | cut -d' ' -f3`"
  ORIG="`namei ${mylink} | grep '^ l ' | tr -s ' ' ' ' | cut -d' ' -f5-`"
 
  echo "Updating timestamp of link <$ORIG> ---> <$LINK> timestamp" 

  # transfer timestamp
  touch -h -m -r "$ORIG" "$LINK"
done

