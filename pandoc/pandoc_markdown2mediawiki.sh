#!/bin/sh

# Purpose: convert Markdown format to Mediawiki
#
# Author: Markus Neteler, 2023
#
# http://pandoc.org/MANUAL.html#pandocs-mediawiki

INPUT=$1 # .md file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r markdown $INPUT.md -t mediawiki -o $TARGETDIR/$INPUT.txt
