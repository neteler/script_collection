#!/bin/sh
# Markus Neteler 3/2009

# proj von http://remotesensing.org/proj/

echo "Koordinatentrafo von Lat/Long nach UTM keeping ED50 datum"
echo "we need the UTM zone for the resulting UTM coordinates:"
echo "    e.g 32 for Germany"
echo "        32 (F. Ovest) / 33 (F. Est) for Italy"
echo "Enter zone now:"
read zone

echo "Example: 11.001649 46.059028"
echo "Enter   east north [z]"

#projection: LATLONG -> UTM
cs2cs +init=epsg:230$zone +to +proj=latlong +datum=WGS84
