#!/bin/sh

# Purpose: convert RST (sphinx) format to Markdown
#
# Author: Markus Neteler, 2019
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .rst file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r rst $INPUT.rst -t markdown -o $TARGETDIR/$INPUT.md
