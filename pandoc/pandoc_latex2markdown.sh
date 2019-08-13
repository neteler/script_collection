#!/bin/sh

# Purpose: convert LaTeX format to Markdown
#
# Author: Markus Neteler, 2019
#
# http://pandoc.org/MANUAL.html#pandocs-markdown

INPUT=$1 # .html file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s $INPUT.tex -t markdown -o $TARGETDIR/$INPUT.md
