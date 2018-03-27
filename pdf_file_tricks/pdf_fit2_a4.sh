#!/bin/sh

# https://stackoverflow.com/questions/7446552/resizing-a-pdf-using-ghostscript

IN=$1
OUT=$2

if [ $# -ne 2 ] ; then
   echo "Usage:
$0 input.pdf output.pdf"
   exit 1
fi

gs \
 -o $OUT \
 -sDEVICE=pdfwrite \
 -sPAPERSIZE=a4 \
 -dFIXEDMEDIA \
 -dPDFFitPage \
 -dCompatibilityLevel=1.4 \
  $IN

