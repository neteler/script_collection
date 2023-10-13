#!/bin/sh

# Purpose: convert Markdown format to ODT
#
# Author: Markus Neteler, 2023
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .md file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r markdown $INPUT.md -t odt -o $TARGETDIR/$INPUT.odt
