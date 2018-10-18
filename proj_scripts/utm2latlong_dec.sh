#!/bin/sh
# Markus Neteler 6/2005

# proj von http://remotesensing.org/proj/

echo "Koordinatentrafo from UTM to keeping WGS84 datum"
echo "Enter zone now:"
read zone

echo "Example: 691880 4870070"
echo "Enter   east north [z]"

#/usr/local/share/proj/epsg
#projection: LATLONG -> UTM
cs2cs -f "%.8f" +init=epsg:326$zone +to +proj=latlong +datum=WGS84
