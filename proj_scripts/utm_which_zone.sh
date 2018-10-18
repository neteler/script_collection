#!/bin/sh

# MN
#calculate UTM zone from LatLong

if [ $# -lt 2 ] ; then
 echo "Requires 'octave' to be installed."
 echo ""
 echo "Usage:  (LONG: x LAT: y)"
 echo "      utm_which_zone.sh LONG LAT"
 exit 1
fi

LONG=$1
LAT=$2

echo "
% utm_zone.m   Matlab (or gpl'd Octave)
% Calc UTM zone from Lat/Lon position.
%  Hamish Bowman, mid 2002 sometime
%
% UTM is based on a Transverse Mercator (conformal, cylindrical) projection.
% 60 zones. Width 6deg lon, numbered 1 to 60, starting at 180deg lon (west).
%  8deg lat strips, C to X northwards, omitting I and O, beginning at 80deg
%  south.
%
% Panama: Clark1866, NAD27
% Zone:
%
% West is negative, south is negative
if (exist('LatLon') ~= 1)
        LatLon = [$LAT  $LONG ]
end

Strips = [ 'C' 'D' 'E' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X'];

Zone = ceil((LatLon(2)+180)/6)
Strip = Strips(ceil((LatLon(1)+80)/8))
" | octave -q


