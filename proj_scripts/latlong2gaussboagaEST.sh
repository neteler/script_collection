#!/bin/sh
#latlong to gauss boaga with internationl (hayford 1909)

# $Date: 2005-10-11 19:11:57 +0200 (Tue, 11 Oct 2005) $

echo "Lat/Long -> GaussBoaga Rome40/GB/Zone2 fuso Est (15d) datum transformation"
echo "Example: 12d14'46.7 45d21'36.1N 100 (d means degree etc.)"
echo "Enter: east north elevation (long lat elevation):"
###old: proj +proj=tmerc +ellps=intl +lat_0=0.0000000000 +lon_0=15.0 +x_0=2520000.0 +k=0.9996 

#cs2cs +proj=latlong +datum=WGS84 +to +init=epsg:26592 +towgs84=-225,-65,9

#http://remotesensing.org/lists/proj_archive/msg00485.html
#BUG UBG
#cs2cs +proj=latlong +datum=WGS84 +to +init=epsg:26592 \
#      +towgs84=-85.88,-28.85,+49.67,-1.003,-2.383,-1.808,-27.82

#Datum from GRASS 5.3/ crs.ifag.de:
#-f "%.8f"
cs2cs +proj=latlong +datum=WGS84 \
      +to +proj=tmerc +lat_0=0 +lon_0=12 \
      +k=0.999600 +x_0=2520000 +y_0=0 +ellps=intl +units=m \
      +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +no_defs
