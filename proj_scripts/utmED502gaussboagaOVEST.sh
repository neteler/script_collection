#!/bin/sh

# Markus Neteler 2/2003
# Version: $Date: 2005-10-11 19:11:57 +0200 (Tue, 11 Oct 2005) $

# proj von http://remotesensing.org/proj/

echo "Coordinaten transformation
       from UTM/ED50
       to   Gauss-Boaga Fuso Ovest/Roma40 Datum"
echo "We need the UTM zone"
echo "    e.g. 32 for Germany"
echo "    e.g. 32[/33] for Italy"
read UTMZONE

echo "Example: 655610.27  5069177.84  0.000"
echo "Enter   east north [z]"

#Datum from:
# http://www.colorado.Edu/geography/gcraft/notes/datum/dlist.html
# ED50 / UTM zone 32N
# <23032>
# to
# Monte Mario (Rome) / Italy zone 1
# <26591>
cs2cs +init=epsg:230$UTMZONE +to +init=epsg:26591 \
      +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +no_defs
