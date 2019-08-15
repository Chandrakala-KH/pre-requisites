#!/bin/bash
KERNALV=`uname -r`
KERNELHEADER=`rpm -qa | grep -i kernel-header`
echo "kernal version is: $KERNALV" and echo "kernel header version is: $KERNELHEADER"
echo " comparing both values"
if [ "$KERNALV" == "$KERNELHEADER" ]; then
  echo "Pass"
 else
   echo "fail"
fi
