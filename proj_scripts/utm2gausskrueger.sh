# Markus Neteler 1/2003

# proj von http://remotesensing.org/proj/

echo "Koordinatentrafo UTM/WGS84->Gauss-Krueger/Potsdam_Rauenberg_DHDN Datum"
echo "Zum Umrechnen brauchen wir die UTM Zone"
echo "    z.B. 32 fuer BRD"
read UTMZONE

echo "Zum Umrechnen brauchen wir auch den Bezugsmeridian"
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
echo "------------------------------------------------------------------"
echo "Enter:"
echo "Ostwert Nordwert Hoehe"

#Datum from:
# http://www.colorado.Edu/geography/gcraft/notes/datum/dlist.html
cs2cs +init=epsg:326$UTMZONE +to +init=epsg:3146$zone +towgs84=606,23,413
