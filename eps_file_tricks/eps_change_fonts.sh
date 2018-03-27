# see also
#  http://www.grassbook.org/neteler/highres_pdf.html
#  anleitungen/eps_tricks.txt

cat  Fig_2_ae_albop_P_A.eps| sed 's+Times-Bold+Arial-Bold+g' |\
   sed 's+Times-Roman+Arial-Regular+g' |\
   sed 's+Times+Arial-Regular+g' |\
   sed 's+Helvetica-BoldOblique+Arial-BoldItalic+g' |\
   sed 's+Helvetica-Oblique+Arial-ReguItalic+g' |\
   sed 's+Helvetica-Bold+Arial-Bold+g' |\
   sed 's+Helvetica-Bold-iso+Arial-Bold+g' |\
   sed 's+Helvetica+Arial-Regular+g' |\
   sed 's+Helvetica-iso+Arial-Regular+g' |\
   sed 's+Symbol+StandardSymL+g' |\
   sed 's+ZapfDingbats+Dingbats+g' > new_graphics.eps

