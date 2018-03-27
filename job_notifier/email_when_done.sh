#!/bin/sh

# send email, pass string as parameter:

# $#: number of parameters given to script
# $0: name of the program/script

if [ $# -ne 2 ] ; then
 echo "Usage:"
 echo "  $0 jobname to_address"
 exit 1
fi

#TO_ADDR="markus.neteler@fmach.it"
TO_ADDR=$2

# reply address must be with domain name
DOMAIN_WORD_NUM=`hostname | tr -s '.' ' ' | wc -w`
if [ $DOMAIN_WORD_NUM -gt 2 ] ; then
   # all is fine, hostname contains full domain name
   # so we use the current user name and current machine name as REPLY_TO address
   REPLY_TO="$USER@`hostname`"
else
   # ops, incomplete hostname without domain name..:
   # so we use the TO_ADDR to have a reasonable REPLY_TO address
   REPLY_TO=$TO_ADDR
fi

SUBJ="Job $1 done"
MESG="Job $1 done at `date`."

echo "$MESG" | mail -s "$SUBJ" -r $REPLY_TO $TO_ADDR

