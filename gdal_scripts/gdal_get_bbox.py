#!/usr/bin/env python

# mundialis 2017
# based on
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

def GetExtent(gt,cols,rows):
    ''' Return list of corner coordinates from a geotransform

        @type gt:   C{tuple/list}
        @param gt: geotransform
        @type cols:   C{int}
        @param cols: number of columns in the dataset
        @type rows:   C{int}
        @param rows: number of rows in the dataset
        @rtype:    C{[float,...,float]}
        @return:   coordinates of each corner
    '''
    ext=[]
    xarr=[0,cols]
    yarr=[0,rows]

    for px in xarr:
        for py in yarr:
            x=gt[0]+(px*gt[1])+(py*gt[2])
            y=gt[3]+(px*gt[4])+(py*gt[5])
            ext.append([x,y])
            print x,y
        yarr.reverse()
    return ext

def ReprojectCoords(coords,src_srs,tgt_srs):
    ''' Reproject a list of x,y coordinates.

        @type geom:     C{tuple/list}
        @param geom:    List of [[x,y],...[x,y]] coordinates
        @type src_srs:  C{osr.SpatialReference}
        @param src_srs: OSR SpatialReference object
        @type tgt_srs:  C{osr.SpatialReference}
        @param tgt_srs: OSR SpatialReference object
        @rtype:         C{tuple/list}
        @return:        List of transformed [[x,y],...[x,y]] coordinates
    '''
    trans_coords=[]
    transform=osr.CoordinateTransformation( src_srs, tgt_srs)
    for x,y in coords:
        x,y,z=transform.TransformPoint(x,y)
        trans_coords.append([x,y])
    return trans_coords


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

	gt=ds.GetGeoTransform()
	cols=ds.RasterXSize
	rows=ds.RasterYSize
	ext=GetExtent(gt,cols,rows)
	
	src_srs=osr.SpatialReference()
	src_srs.ImportFromWkt(ds.GetProjection())
	#tgt_srs=osr.SpatialReference()
	#tgt_srs.ImportFromEPSG(4326)
	tgt_srs = src_srs.CloneGeogCS()
	
	geo_ext=ReprojectCoords(ext,src_srs,tgt_srs)

    print "someghing"

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

