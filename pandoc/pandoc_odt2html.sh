#!/bin/sh

# Purpose: convert ODT format to HTML
#
# Author: Markus Neteler, 2024
#
# http://pandoc.org/MANUAL.html

INPUT=$1 # .odt file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r odt $INPUT.odt -t html -o $TARGETDIR/$INPUT.html
