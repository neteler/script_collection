#!/bin/sh

## Markus Neteler, 2016
# A3 landscape --> 2*A4 portait

# http://askubuntu.com/questions/206468/split-tile-a3-landscape-pdf-to-a4-portrait
INPUT=$1
SPLIT_OUTPUT=$2

if [ $# -ne 2 ] ; then
  echo "Usage:

$0 path/to/input_A3.pdf path/to/output_splitted_A4.pdf"
  exit 1
fi

## FAILS
# dnf -y install pdfposter
# pdfposter --media-size=a4 --poster-size=2x1a4 $INPUT $SPLIT_OUTPUT


# dnf -y install texlive-pdfjam-bin

# glue 2 to 1 
## pdfjam --nup 2x1 file1.pdf file2.pdf --outfile DONESKI.pdf

# http://stackoverflow.com/questions/3085930/split-a4-pdf-page-into-two-a5-and-back-again/30617745#30617745

??
exit 1
pdfjam --nup 1x2 $INPUT --outfile $SPLIT_OUTPUT

