#!/bin/sh
# Markus Neteler 2014

# proj von http://remotesensing.org/proj/

echo "Koordinatentrafo von Lat/Long nach EU LAEA (EPSG: 3035)"
echo "Example: 16d32'52E  45d8'23N (d is degree)"
echo "Enter   east north [z]"

#/usr/local/share/proj/epsg
#projection: LATLONG -> EU LAEA
cs2cs +proj=latlong +datum=WGS84 +to +init=epsg:3035
