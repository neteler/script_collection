#!/bin/sh

# Purpose: convert Markdown format to RST (sphinx)
#
# Author: Markus Neteler, 2019
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .md file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r markdown $INPUT.md -t rst -o $TARGETDIR/$INPUT.rst
