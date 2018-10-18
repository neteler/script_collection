#!/bin/sh

# Markus Neteler 6/2002

# proj von http://remotesensing.org/proj/

echo "Koordinatentrafo Lat/Long->Gauss-Krueger/Potsdam_Rauenberg_DHDN Datum"
echo "Zum Umrechnen brauchen wir den Bezugsmeridian"
echo "    in Grad (z.B. 9):"
read bezug

zone=`expr $bezug / 3 `     # durch 3
ans=`expr $zone \* 1000000` # mal 1M
ans=`expr $ans + 500000`   # + 500k
echo "False Easting fuer G-K. ist also: $ans"

echo "------------------------------------------------------------------"
echo "Jetzt eingeben: East North Hoehe"
echo "                dann return, Ende mit Strg-C"
echo ""
echo "Ergebnis wird in Gauss-Krueger berechnet."
echo "Eingabebeispiel: 10d32'E 52d58'N 100.0 (d steht fuer degree etc.)"
echo "------------------------------------------------------------------"
echo "Enter:"
echo "Ostwert Nordwert Hoehe"

#Datum from: GRASS 6.1/crs.ifag.de whole country (3m):
cs2cs +proj=latlong +datum=WGS84 +to +init=epsg:3146$zone +towgs84=598.1,73.7,418.2,0.202,0.045,-2.455,6.70

