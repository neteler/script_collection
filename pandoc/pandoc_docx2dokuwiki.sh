#!/bin/sh

# Purpose: convert DOCX format to Dokuwiki
#
# Author: Markus Neteler, 2019
#
# Hint: convert ODP to DOCX with e.g. https://convertio.co/de/odp-docx/

INPUT=$1 # .docx file without extension

TARGETDIR=.

pandoc --extract-media $TARGETDIR -s -r docx $INPUT.docx -t dokuwiki -o $TARGETDIR/$INPUT.txt
