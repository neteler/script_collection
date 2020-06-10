#!/bin/sh

# Purpose: convert dokuwiki format to Mediawiki
#
# Author: Markus Neteler, 2020
#
# http://pandoc.org/MANUAL.html#pandocs-mediawiki

INPUT=$1 # .doku file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r dokuwiki $INPUT.html -t mediawiki -o $TARGETDIR/$INPUT.txt
