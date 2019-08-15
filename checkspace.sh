#!/bin/bash
SPACE=`df -h| grep -vE '^Filesystem|tmpfs|cdrom'`
echo "root space is: $SPACE"
SPACEF=`df | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $4 " " $1 }'| awk '{ print $1}'`
if [ $SPACEF -gt 2097152 ]; then
   echo "root space: Pass"
else
 echo "root space: Fail"
fi
