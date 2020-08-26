#!/bin/sh

# Purpose: convert ODT format to Markdown
#
# Author: Markus Neteler, 2020
#
# http://pandoc.org/MANUAL.html

INPUT=$1 # .odt file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r odt $INPUT.odt -t markdown -o $TARGETDIR/$INPUT.md
