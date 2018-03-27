#!/bin/sh

FILE=firma_neteler.png
FILENEW=firma_neteler_transparenz.png

# http://www.imagemagick.org/Usage/channels/#mask_creation
convert $FILE -bordercolor white -border 1x1 -matte \
          -fill none -fuzz 10%  -draw 'matte 0,0 floodfill' \
          -shave 1x1 $FILENEW

