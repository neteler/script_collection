#!/bin/sh

# from http://blog.robfelty.com/2008/03/11/convert-pdf-to-png-with-imagemagick/ 

#   -quality 90 \

file=$1

# no no no:
# convert -density 800x800 -trim $file  `echo $file|cut -f1 -d'.'`.png

# yes:
gs -q -sDEVICE=png16m -r600 -dBATCH -dNOPAUSE -dFirstPage=1 -dLastPage=1 -sOutputFile=`echo $file|cut -f1 -d'.'`.png $file

