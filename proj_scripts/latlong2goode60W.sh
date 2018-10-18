#!/bin/sh

# Markus Neteler 6/2006

#URL
# http://www.goriteimage.com/faq/goodesarticle.html

echo "Reprojection from LatLong to Goode Homolosine lon_0 60W"
echo ""
#echo -n "Enter CENTRAL MERIDIAN (e.g. 60W):"
#read meridian
echo "Enter: East North [z]"
echo "CTRL-C to stop"
meridian=60W
cs2cs +proj=latlong +datum=WGS84 +to +proj=sinu +lon_0=$meridian +ellps=sphere
