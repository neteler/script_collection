#!/bin/sh

# Purpose: convert DOCX format to RST (sphinx)
#
# Author: Markus Neteler, 2017
#
# Hint: convert ODP to DOCX with e.g. https://convertio.co/de/odp-docx/

#INPUT=nina2016_13_grass_temporal # .docx
INPUT=$1

#TARGETDIR=source/basic
TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r docx $INPUT.docx -t rst -o $TARGETDIR/$INPUT.rst
