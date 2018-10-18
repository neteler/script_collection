#!/bin/sh

# Markus Neteler 6/2002
# Version: $Date: 2004-02-04 18:37:25 +0100 (Wed, 04 Feb 2004) $
# neteler@itc.it

echo "Projection from lat/long to GaussBoaga (Rome40/GB/Zone1) fuso Ovest"
echo "    with datum transformation"
echo "Lat/Long - GaussBoaga fuso Ovest, Roma40"
echo "Example: 11d12'26E 46d06'17N 100 (d means degree, long lat elevation)"
echo "Enter:   east north elevation"

#the towgs84 was missing in nad/epsg file!
# Taken from LAS software:
# http://dbwww.essc.psu.edu/lasdoc/overview/geomreg/dtm_list.html
#cs2cs +proj=latlong +datum=WGS84 +to +init=epsg:26591 +towgs84=-225,-65,9

#http://remotesensing.org/lists/proj_archive/msg00485.html
#BUG BUG
#cs2cs +proj=latlong +datum=WGS84 +to +init=epsg:26591 \
#      +towgs84=-85.88,-28.85,+49.67,-1.003,-2.383,-1.808,-27.82

#Datum from GRASS 5.3/ crs.ifag.de:
cs2cs +proj=latlong +datum=WGS84 +to +proj=tmerc +lat_0=0 +lon_0=9 \
      +k=0.999600 +x_0=1500000 +y_0=0 +ellps=intl +units=m \
      +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 \
      +no_defs
