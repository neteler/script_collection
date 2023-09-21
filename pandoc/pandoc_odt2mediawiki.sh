#!/bin/sh

# Purpose: convert ODT format to Mediawiki
#
# Author: Markus Neteler, 2023
#
# http://pandoc.org/MANUAL.html#pandocs-mediawiki

INPUT=$1 # .odt file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r odt $INPUT.odt -t mediawiki -o $TARGETDIR/$INPUT.txt
