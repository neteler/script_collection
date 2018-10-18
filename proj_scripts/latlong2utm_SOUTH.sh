#!/bin/sh

# Markus Neteler 9/2003
# proj von http://remotesensing.org/proj/

echo "Koordinatentrafo von Lat/Long nach UTM keeping WGS84 datum"
echo "Southern hemisphere"
echo "we need the UTM zone for the resulting UTM coordinates:"
echo "    e.g 20 for Argentina"
echo "Enter zone now:"
read zone

echo "Example: 64d33'32.3657W 33d10'40.5166S (d is degree)"
echo "Enter   east north [z]"

#/usr/local/share/proj/epsg
#projection: LATLONG -> UTM
cs2cs +proj=latlong +datum=WGS84 +to +init=epsg:327$zone
