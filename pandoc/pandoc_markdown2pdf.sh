#!/bin/sh

# Purpose: convert Markdown format to HTML
#
# Author: Markus Neteler, 2021
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .md file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r markdown $INPUT -t pdf -o $TARGETDIR/$INPUT.pdf
