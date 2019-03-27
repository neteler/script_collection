#!/bin/sh

# Purpose: convert HTML format to Mediawiki
#
# Author: Markus Neteler, 2019
#
# http://pandoc.org/MANUAL.html#pandocs-mediawiki

INPUT=$1 # .html file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r html $INPUT.html -t mediawiki -o $TARGETDIR/$INPUT.txt
