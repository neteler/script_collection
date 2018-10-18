#!/bin/sh

# Markus Neteler 6/2002
# neteler@itc.it

echo "Lat long to Krovak-JTSK (Czech/Slovak)"
echo "Enter e.g."
echo "      16d50'59.1790E 50d12'32.4416N 100"
echo "-----------------------------------------------"

#Formulas:
#  http://www.ihsenergy.com/epsg/guid7.html#1.4.3
#
#  online: http://www.volny.cz/muzeumsokolov/oddeleni/wgs-jtsk.htm
 
#WGS84 -> JTSK document, used for datum parameters:
#
#http://www.geospeleos.com/Mapovani/WGS84toSJTSK/WGS_JTSK.pdf
# Examples:
#
# 14d1'29.96593E 49d48'31.47599N 474.375
# expected:    -775279.26 -1069759.49 428.29
# calculated1: -774990.70 -1069796.08 456.810 (with datum trafo Hermannskogel)
# calculated2: -775363.55 -1069833.02 474.375 (without datum trafo = 'proj')
# 1. table, page10:
# calculated3: -775300.70 -1069789.68 484.536 (with different datum: 533.20,75.375,452.045)
# 2. table, page10:
# calculated4: -775273.10 -1069767.49 460.245 (with different datum: 573.45,60.5,453.90)
# 1. table, page12:
# calculated5: -775279.30 -1069759.56 451.238 (table from page 12 - max)

# 14d30'19.97611E 50d10'11.57182N 295.821
# expected:     -735594.01 -1034749.63 251.11
# 2. table, page10:
# calculated4:  -735589.24 -1034756.32 282.640
# 1. table, page12:
# calculated5:	-735594.13 -1034749.76 273.474
#
#Hermannskogel datum: 653,-212,449
#
#towgs84=shiftx,shifty,shiftz,rotx,roty,rotz,scale (rot in sec)

#here we go:
echo "Using: datum: 570.69,85.69,462.840,4.99821,1.58676,5.2611,0.000003543"
echo "    from http://www.geospeleos.com/Mapovani/WGS84toSJTSK/WGS_JTSK.pdf"
echo "         (table1, page 12, max_r row)"
echo "Enter values: east north elevation"

# Now using 1. table, page12:
cs2cs +proj=latlong +datum=WGS84 \
      +to +proj=krovakgis +ellps=bessel \
      +towgs84=570.69,85.69,462.840,4.99821,1.58676,5.2611,0.000003543

#unused:
#2. table, page10:
#      +to +proj=krovakgis +ellps=bessel +towgs84=573.45,60.5,453.90
#1. table, page10:
#      +to +proj=krovakgis +ellps=bessel +towgs84=533.20,75.375,452.045
#Hermannskogel:
#      +to +proj=krovakgis +ellps=bessel +towgs84=653,-212,449
