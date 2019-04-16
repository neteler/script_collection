#!/bin/sh

# Purpose: convert ODT format to Dokuwiki
#
# Author: Markus Neteler, 2019
#
# http://pandoc.org/MANUAL.html

INPUT=$1 # .odt file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r odt $INPUT.odt -t dokuwiki -o $TARGETDIR/$INPUT.txt
