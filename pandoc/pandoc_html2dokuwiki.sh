#!/bin/sh

# Purpose: convert HTML format to Dokuwiki
#
# Author: Markus Neteler, 2018
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .html file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r html $INPUT.html -t dokuwiki -o $TARGETDIR/$INPUT.txt
