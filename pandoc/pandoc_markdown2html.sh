#!/bin/sh

# Purpose: convert Markdown format to HTML
#
# Author: Markus Neteler, 2020
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .md file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r markdown $INPUT.md -t html -o $TARGETDIR/$INPUT.html
