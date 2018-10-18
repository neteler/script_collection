#!/bin/sh
# Markus Neteler 12/2008

# proj von http://remotesensing.org/proj/

echo "Coordinate trafo from UTM to keeping ED50 datum"
echo "Enter zone now:"
read zone

echo "Example: 677502 151969"
echo "Enter   east north [z]"

#/usr/local/share/proj/epsg
#projection: LATLONG -> UTM
cs2cs -v -f "%.8f" +init=epsg:230$zone +to +proj=latlong +datum=WGS84
