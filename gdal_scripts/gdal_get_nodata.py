#!/usr/bin/env python

# mundialis 2017
# based on
#    https://pcjericks.github.io/py-gdalogr-cookbook/raster_layers.html
#
# Requirements:
#  yum install gdal-python

from osgeo import gdal
import sys
gdal.UseExceptions()

def Usage():
    print("""
    $ gdal_get_nodata.py input-raster [ band number ]
    """)
    sys.exit(1)

def main( input_file, band_num = 1 ):
    src_ds = gdal.Open( input_file )
    if src_ds is None:
        print 'Unable to open %s' % input_file
        sys.exit(1)

    try:
        srcband = src_ds.GetRasterBand(band_num)
    except RuntimeError, e:
        print 'No band %i found' % band_num
        print e
        sys.exit(1)


    print "nodata=" + str(srcband.GetNoDataValue())
    print "min=" + str(srcband.GetMinimum())
    print "max=" + str(srcband.GetMaximum())
    print "scale=" + str(srcband.GetScale())
    print "unit_type=" + srcband.GetUnitType()

if __name__ == '__main__':

    if len( sys.argv ) < 2:
        print """
        ERROR: you must supply at least one argument:
        1) input raster map, and optionally 2) the band number to retrieve
        """
        Usage()

    if len (sys.argv) == 2:
       main( sys.argv[1] )

    if len (sys.argv) > 2:
       main( sys.argv[1], int(sys.argv[2]) )

