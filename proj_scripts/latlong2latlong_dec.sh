#!/bin/sh

# latlong to latlong decimal
# Markus Neteler 12/2002


echo "latlong DMS to LatLong decimal"
echo "  Example: 11d58'E 46d21'N "
echo "Enter east north [elevation]:"

cs2cs -f "%.8f" +proj=latlong +datum=WGS84 \
      +to +proj=latlong +datum=WGS84

