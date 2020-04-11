#! /bin/bash

# http://www.techrepublic.com/blog/opensource/how-to-remove-duplicate-files-without-wasting-time/2667

OUTF=/tmp/rem-duplicates.sh;

# at least 5MB big
#SIZE="+5000k"
SIZE="+0k"

echo "#! /bin/sh" > $OUTF;
echo ""          >> $OUTF;

# http://stackoverflow.com/questions/4210042/exclude-directory-from-find-command
# exclude SVN stuff: -path \.svn -prune -o
find "$@" -path \.svn -prune -o -type f -size $SIZE -print0 | xargs -0 -n1 md5sum | sort --key=1,32 | uniq -w 32 -d --all-repeated=separate | sed -r 's/^[0-9a-f]*( )*//;s/([^a-zA-Z0-9./_-])/\\\1/g;s/(.+)/#rm \1/' >> $OUTF;

chmod a+x $OUTF

echo "Written $OUTF"
exit 0
