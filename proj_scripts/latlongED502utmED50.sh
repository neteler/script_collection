#!/bin/sh
# Markus Neteler 2/2003

# proj von http://remotesensing.org/proj/

echo "Coordinate transformation 
      from Lat/Long/ED50 datum
      to   UTM keeping ED50 datum"
echo "we need the UTM zone for the resulting UTM coordinates:"
echo "    e.g 32 for Germany"
echo "        32 (F. Ovest) / 33 (F. Est) for Italy"
echo "Enter zone now:"
read zone

echo "Example: 16d32'52E  45d8'23N (d is degree)"
echo "Enter   east north [z]"

#projection: LATLONG/ED50 -> UTM/ED50
cs2cs +init=epsg:4230 +to +init=epsg:230$zone
