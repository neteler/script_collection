#!/bin/sh

# in the current directory:
#  changes filenames/directories with white space 
#  to same names with underscores

# MN 2006
# from
#  http://lists.oregonstate.edu/pipermail/linux/2004-September/000632.html

# 2> /dev/null suppresses confusing error messages for files/dirs
#    without white space
for i in *; do 
 echo ${i} | grep '._'
 if [ $? -eq 0 ] ; then
   NEW=`echo ${i} | sed 's+\._+_+g'`
   mv ${i} $NEW
 fi
done

for i in *; do
 echo ${i} | grep ',_'
 if [ $? -eq 0 ] ; then
   NEW=`echo ${i} | sed 's+\,_+_+g'`
   mv ${i} $NEW
 fi
done

for i in *; do
 echo ${i} | grep ','
 if [ $? -eq 0 ] ; then
   NEW=`echo ${i} | sed 's+\,+_+g'`
   mv ${i} $NEW
 fi
done

for i in *; do
 echo ${i} | grep '('
 if [ $? -eq 0 ] ; then
   NEW=`echo ${i} | sed 's+(+_+g'`
   mv ${i} $NEW
 fi
done

for i in *; do
 echo ${i} | grep ')'
 if [ $? -eq 0 ] ; then
   NEW=`echo ${i} | sed 's+)+_+g'`
   mv ${i} $NEW
 fi
done

for i in *; do
 echo ${i} | grep '__'
 if [ $? -eq 0 ] ; then
   NEW=`echo ${i} | sed 's+\_\_+_+g'`
   mv ${i} $NEW
 fi
done

for i in *; do
 echo ${i} | grep '__'
 if [ $? -eq 0 ] ; then
   NEW=`echo ${i} | sed 's+\_\_+_+g'`
   mv ${i} $NEW
 fi
done

