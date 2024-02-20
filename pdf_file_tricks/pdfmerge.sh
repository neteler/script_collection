#/!bin/sh

#Markus Neteler 11/2003
#merges PDF files into a new PDF

OUT=allpdfs_in_one.pdf

if [ $# -lt 1 -o "$1" = "-h" -o  "$1" = "--help" -o  "$1" = "-help" ] ; then
 echo "pdfmerge.sh: merges PDF files into a new PDF file"
 echo "             Links and booksmarks may get lost"
 echo ""
 echo "Usage:"
 echo ""
 echo "pdfmerge.sh 'file1.pdf file2.pdf [...]'"
 echo "            ^--- note the quoting ----^ "
 echo ""
 echo "The output file name will be: $OUT"
 exit
fi

echo "Merging..."
echo "(links and booksmarks may get lost)"
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$OUT -c save pop -f $1
if [ $? -eq 0 ] ; then
 echo "Sucessfully written $OUT"
fi
