#!/bin/sh

# -dPDFSETTINGS=/screen   (screen-view-only quality, 72 dpi images)
# -dPDFSETTINGS=/ebook    (low quality, 150 dpi images)
# -dPDFSETTINGS=/printer  (high quality, 300 dpi images)
# -dPDFSETTINGS=/prepress (high quality, color preserving, 300 dpi imgs)

#echo "Lowering to 72 DPI..."
#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf $1

#echo "Lowering to 150 DPI..."
#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf $1

echo "Lowering to 300 DPI..."
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output_300dpi.pdf $1

