#!/bin/sh

# DIN A4 page is 595×842 pps (PostScript points, width×height)

#idea from http://ma.juii.net/blog/scale-page-content-of-pdf-files

if [ $# -ne 2 ] ; then
   echo "Usage:
$0 input.pdf [factor]"
   exit 1
fi

IN=`echo $1 | sed -e "s/\(\.pdf\)$//"`
OUT=${IN}.out.pdf
IN=${IN}.pdf

SCALE=$2

if [ "x$SCALE" = "x" ] ; then
   SCALE=1.1
fi

V=`echo "( 1.0 - $SCALE ) * 29.75 * 10" | bc`
H=`echo "( 1.0 - $SCALE ) * 42.10 * 10" | bc`

echo $IN $OUT $SCALE $V $H

gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dSAFER -dCompatibilityLevel="1.4" \
 -dPDFSETTINGS="/printer" -dSubsetFonts=true -dEmbedAllFonts=true \
 -sPAPERSIZE=a4 -sOutputFile=$OUT.tmp \
 -c "<</BeginPage{ $SCALE $SCALE scale $V $H translate}>> setpagedevice" \
 -f $IN

gs \
 -o $OUT \
 -sDEVICE=pdfwrite \
 -sPAPERSIZE=a4 \
 -dFIXEDMEDIA \
 -dPDFFitPage \
 -dCompatibilityLevel=1.4 \
  $OUT.tmp

rm -f $OUT.tmp
echo "Written <$OUT>"
