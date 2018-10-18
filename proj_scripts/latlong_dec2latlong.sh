#!/bin/sh
# latlong dec to latlong

echo "latlong decimal to LatLong DMS"
echo "  Example: 46.091944 12.143333 "
echo "Enter east north [elevation]:"

cs2cs +proj=latlong +datum=WGS84 \
      +to +proj=latlong +datum=WGS84

