#!/bin/sh

# Fedora, Centos:
# dnf -y install aria2 ncftp

DATADIR=`pwd`

# NASA dir
FTPURL="ftp://ladsweb.nascom.nasa.gov/orders/501010555/"
MAXCONN=2

# 1. get plain file list on remote server
ncftpls $FTPURL > /tmp/tmp_aria_list.csv

# 2. re-add the server URL
sed -i -e "s+^+$FTPURL+g" /tmp/tmp_aria_list.csv

# 3. parallelized download
aria2c -c --max-concurrent-downloads=$MAXCONN -i /tmp/tmp_aria_list.csv -d $DATADIR
rm -f /tmp/tmp_aria_list.csv
