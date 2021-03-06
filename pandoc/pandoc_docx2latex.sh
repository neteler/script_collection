#!/bin/sh

# Purpose: convert DOCX format to Latex
#
# Author: Markus Neteler, 2017

#INPUT=nina2016_13_grass_temporal # .docx
INPUT=$1

#TARGETDIR=source/basic
TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r docx $INPUT.docx -t latex -o $TARGETDIR/$INPUT.tex
