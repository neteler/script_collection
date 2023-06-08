#!/bin/sh

# Purpose: convert HTML format to Markdown
#
# Author: Markus Neteler, 2018, 2023
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .html file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r html $INPUT.html -t gfm -o $TARGETDIR/$INPUT.md
