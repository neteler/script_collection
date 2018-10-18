#!/bin/sh

# Markus Neteler 6/2003

echo "Lat long to Krovak (Czech) with Hermannskogel Datum"
echo "Enter e.g."
echo "      16d50'59.1790E 50d12'32.4416N"
echo "-----------------------------------------------"
#http://www.ihsenergy.com/epsg/guid7.html#1.4.3
# -> The example does not match 100% because here we use Datum transformation
# -> using 'proj4' it matches perfectly.

#online: http://www.volny.cz/muzeumsokolov/oddeleni/wgs-jtsk.htm
 
cs2cs -V +proj=latlong +datum=WGS84 \
      +to +proj=krovak +ellps=bessel \
      +towgs84=653,-212,449
    
