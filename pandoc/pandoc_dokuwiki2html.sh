#!/bin/sh

# Purpose: convert dokuwiki format to HTML
#
# Author: Markus Neteler, 2023
#
# http://pandoc.org/MANUAL.html#pandocs-mediawiki

INPUT=$1 # .txt file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r dokuwiki $INPUT.txt -t html -o $TARGETDIR/$INPUT.html
