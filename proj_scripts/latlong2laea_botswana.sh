#!/bin/sh

# Markus Neteler 6/2005

#n=-8.99583333
#s=-29.00416667
#w=15.99999999
#e=34.00833333

echo "-9 16
-9 34
-29 16
-29 34" | cs2cs +proj=latlong +datum=WGS84 +to \
                +proj=laea +lat_0=17S +long_0=21.5E > /tmp/bots
echo LAEA East:
cat /tmp/bots | cut -f1 |sort -n
echo LAEA Nord:
cat /tmp/bots | cut -f2 |sort -n

echo "GRASS
  north:       5456300
  south:       3478200
  east:        -919700
  west:        -3201700

BUT reprojected map, zoomed to it:
 g.region -p
 projection: 99 (Lambert Azimuthal Equal Area)
 zone:       0
 datum:      wgs84
 ellipsoid:  wgs84
 north:      -59500
 south:      -333200
 west:       147500
 east:       462900
 nsres:      100
 ewres:      100
 rows:       2737
 cols:       3154
"
