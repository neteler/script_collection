#!/bin/sh

# Markus Neteler 5/2002
# proj von http://remotesensing.org/proj/

echo "Koordinatentrafo von Lat/Long nach UTM keeping WGS84 datum"
echo "we need the UTM zone for the resulting UTM coordinates:"
echo "    e.g 32 for Germany"
echo "        32 (F. Ovest) / 33 (F. Est) for Italy"
echo "Enter zone now:"
read zone

echo "Example: 16d32'52E  45d8'23N (d is degree)"
echo "Enter   east north [z]"

#/usr/local/share/proj/epsg
#projection: LATLONG -> UTM
cs2cs +proj=latlong +datum=WGS84 +to +init=epsg:326$zone
