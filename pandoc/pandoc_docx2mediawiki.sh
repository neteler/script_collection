#!/bin/sh

# Purpose: convert DOCX format to Mediawiki
#
# Author: Markus Neteler, 2019
#
# http://pandoc.org/MANUAL.html#pandocs-mediawiki

INPUT=$1 # .docx file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r docx $INPUT.docx -t mediawiki -o $TARGETDIR/$INPUT.txt
