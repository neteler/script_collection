#!/bin/sh

# Purpose: find dead links in current directory
# 
# Author:  Markus Neteler, 2005

DEPTH=20

echo "Using -maxdepth $DEPTH ..."

for i in `find . -maxdepth $DEPTH -type l` ; do 
	if [ ! -e $i ] ; then
		echo "rm -f $i "
	fi
done

#####
# alternative
#
#[neteler@oboe all]$ find .  -not -xtype l | grep TODO | grep mice
#./ticks_mice_deer/TODO
#
#[neteler@oboe all]$ find . -type l -not -xtype l | grep TODO
#[neteler@oboe all]$ 

