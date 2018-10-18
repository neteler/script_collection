#!/bin/sh

# Markus Neteler 10/2005
# Version: $Date: 2003/03/10 13:31:49 $

# proj von http://remotesensing.org/proj/

echo "Coordinaten transformation
       from UTM/ED50
       to   Gauss-Boaga Fuso Est/Roma40 Datum"
echo "We need the UTM zone"
echo "    e.g. [32/]33 for Italy"
read UTMZONE

echo "Example: 284331 5026634 100"
echo "Enter   east north [z]"

#Datum from:
# http://www.colorado.Edu/geography/gcraft/notes/datum/dlist.html
# ED50 / UTM zone 32N
# <23032> +proj=utm +zone=32 +ellps=intl +units=m +no_defs  <>
#
# to
# Monte Mario (Rome) / Italy zone 2
# <26592>

# /usr/local/share/proj/epsg

cs2cs +init=epsg:230$UTMZONE +to +init=epsg:26592 \
	+towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +no_defs

