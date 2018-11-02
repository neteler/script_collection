#!/bin/sh

# Purpose: convert Markdown format to Dokuwiki
#
# Author: Markus Neteler, 2018
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .md file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r markdown $INPUT.md -t dokuwiki -o $TARGETDIR/$INPUT.txt
