#!/bin/sh

# by Marco Pratesi  lugroma-tech lugroma.org, 2003
# http://lists.lugroma.org/pipermail/lugroma-tech/2003-April/012137.html
# modified MN 2005, 2015, 2016

if [ $# -ne 1 ] ; then
 echo "Changes a font to another in ODP OOffice file (edit this file for font name)"
 echo oo_change_fonts.sh bla.odp
 exit 1
fi

FILE=$1
EXT=`echo "$FILE" | rev | cut -d'.' -f1 | rev`

#TARGETFONT="Bitstream Vera Sans"
#TARGETFONT="Candara"
TARGETFONT="Liberation Sans"


if test ! -e $FILE ; then
 echo "File $FILE not found"
 exit 1
fi

mkdir AAA/
cp $FILE AAA/
cd AAA/
unzip $FILE
rm -f $FILE

########################


for i in `seq 1 112`
do
  mv "Object $i" Object_$i
done
cd ..

for XMLFILE in `find AAA -name '*xml'`
do
cat "$XMLFILE" | sed -e "s+Bitstream Vera Sans+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Charter+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Bitstream Vera Serif+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+$TARGETFONT New Roman+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+CorporateSRegular+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+CorporateSBold+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Isonorm3098+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Corporatesbold+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Nimbus Sans L+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Verdana+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Liberation Serif+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Nimbus Roman No9 L+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Helvetica+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Times+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Arial+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Book Antiqua+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+monospace+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Sintony+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"
cat "$XMLFILE" | sed -e "s+Miriam Libre+$TARGETFONT+g" > foobar.tmp
mv foobar.tmp "$XMLFILE"

done

cd AAA
for i in `seq 1 112`
do
mv Object_$i "Object $i"
done


########################
NEWFILE=`basename ${FILE} .$EXT`
zip -r -9 ${NEWFILE}_newfonts.zip *
\mv ${NEWFILE}_newfonts.zip ../${NEWFILE}_newfonts.$EXT
cd ..
rm -rf AAA
mv ${FILE} ${NEWFILE}_old.$EXT
mv ${NEWFILE}_newfonts.$EXT ${NEWFILE}.$EXT
echo "Written ${NEWFILE}.$EXT (original: ${NEWFILE}_old.$EXT)"

