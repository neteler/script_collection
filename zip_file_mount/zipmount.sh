#!/bin/sh

# mount ZIP and TAR.GZ files via fuse-zip|archivemount
# Markus Neteler, 4/2016
#
# needs:
#  ZIP:     dnf -y install fuse-zip     | apt-get install fuse-zip
#  TAR.GZ:  dnf -y install archivemount | apt-get install archivemount

# check for fuse-zip,archivemount
for PRGM in fuse-zip archivemount ; do
   if [ ! -x "`which $PRGM 2> /dev/null`" ] ; then
      echo "ERROR: $PRGM must be installed to use this program."
      exit 1
   fi
done

###
ZIPFILE=$1

if [ $# -ne 1 ] ; then
   echo "Usage:
`basename $0` file.zip|file.tar|file.tar.gz|file.tgz"
   exit 1
fi
if [ ! -f ${ZIPFILE} ] ; then
   echo "${ZIPFILE} does not exist"
   exit 1
fi

echo ${ZIPFILE} | grep '.zip$' > /dev/null
if [ $? -ne 0 ] ; then
   echo ${ZIPFILE} | grep '.tar$\|.tar.gz$\|.tgz$' > /dev/null
   if [ $? -ne 0 ] ; then
      echo "${ZIPFILE} does not have neither .zip nor .tar,.tar.gz,.tgz extension"
      exit 1
   else
     ZIPPGM=archivemount
   fi
else
  ZIPPGM=fuse-zip
fi

if [ $# -ne 1 ] ; then
   echo "Usage:"
   echo "$0 file.zip|file.tar|file.tar.gz|file.tgz"
   exit 1
fi

###########
if [ "$ZIPPGM" = "fuse-zip" ] ; then
 ZIPDIR=`basename ${ZIPFILE} .zip`

 mkdir -p ${ZIPDIR}
 fuse-zip ${ZIPFILE} ${ZIPDIR}
 echo "To enter ZIP file, run
  cd ${ZIPDIR}"

 # now do something in the ZIP file...

 # echo "To unmount: <fusermount -u ${ZIPDIR} && rmdir ${ZIPDIR}>"
 echo "fusermount -u ${ZIPDIR} && rmdir ${ZIPDIR} ; rm -f /tmp/unmount_${ZIPDIR}.sh" > /tmp/unmount_${ZIPDIR}.sh
 chmod u+x /tmp/unmount_${ZIPDIR}.sh
 echo "To unmount: 
  sh /tmp/unmount_${ZIPDIR}.sh"

 ###########
else
 # so must be a tgz
 ZIPDIR=`basename ${ZIPFILE} .tar`
 ZIPDIR=`basename ${ZIPDIR} .tar.gz`
 ZIPDIR=`basename ${ZIPDIR} .tgz`
 mkdir -p ${ZIPDIR}
 archivemount ${ZIPFILE} ${ZIPDIR}
 echo "To enter tar.gz file, run
  cd ${ZIPDIR}"

 # now do something in the TAR file...

 # echo "To unmount: <fusermount -u ${ZIPDIR} && rmdir ${ZIPDIR}>"
 echo "fusermount -u ${ZIPDIR} && rmdir ${ZIPDIR} ; rm -f /tmp/unmount_${ZIPDIR}.sh" > /tmp/unmount_${ZIPDIR}.sh
 chmod u+x /tmp/unmount_${ZIPDIR}.sh
 echo "To unmount: 
  sh /tmp/unmount_${ZIPDIR}.sh"
fi

# it is the user's responsibility to unmount the stuff (using the helper script)

