#!/bin/sh

# Purpose: convert HTML format to DOCX
#
# Author: Markus Neteler, 2020
#
# http://pandoc.org/MANUAL.html#pandocs-html

INPUT=$1 # .html file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r html $INPUT.html -t docx -o $TARGETDIR/$INPUT.docx
