#!/bin/sh
# Markus Neteler 2/2003
# Version: $Date: 2003-03-10 14:31:49 +0100 (Mon, 10 Mar 2003) $

# proj von http://remotesensing.org/proj/

echo "Coordinate transformation 
      from Lat/Long/ED50 datum
      to   Gauss-boaga Ovest/Roma40"

echo "Example: 11d00'03E 45d45'28N 1000 (d is degree)"
echo "Enter   east north [z]"

#projection: LATLONG/ED50 -> Gauss-boaga Ovest/Roma40

#Datum from:
# http://www.colorado.Edu/geography/gcraft/notes/datum/dlist.html
# ED50 / Latlong
# <4230>
# to
# Monte Mario (Rome) / Italy zone 1
# <26591>
#projection: LATLONG/ED50 -> Gauss-boaga Ovest/Roma40
#cs2cs +init=epsg:4230 +to +init=epsg:26591 +towgs84=-225,-65,9

cs2cs +init=epsg:4230 +to +init=epsg:26591 \
      +towgs84=-85.88,-28.85,+49.67,-1.003,-2.383,-1.808,-27.82
