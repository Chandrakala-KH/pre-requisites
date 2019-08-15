#!/bin/bash
SPACE=`df -h| grep -vE '^Filesystem|tmpfs|cdrom'`
echo "1.root space is: $SPACE"
SPACEF=`df | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $4 " " $1 }'| awk '{ print $1}'`
if [ $SPACEF -gt 2097152 ]; then
   echo "root space: Pass"
else
 echo "root space: Fail"
fi
echo "*************************"
KERNALV=`uname -r`
KERNELHEADER=`rpm -qa | grep -i kernel-header`
echo "2.kernal version is: $KERNALV" and echo "kernel header version is: $KERNELHEADER"
echo " comparing both values"
if [ "$KERNALV" == "$KERNELHEADER" ]; then
  echo "Pass"
 else
   echo "fail"
fi
echo "***************************"
if command -v python &>/dev/null; then
    echo "3.Python  is installed"
    pyv="$(python -V 2>&1)"
    echo "Python version: $pyv"
else
    echo Python  is not installed
fi
ver=$(python -V 2>&1 | sed 's/.* \([0-9]\).\([0-9]\).*/\1\2/')
if [ "$ver" -gt "24" ]; then
    echo "pass"
    else
    echo "fail"
fi
echo "***************************"
prerequisite=GRUB
BOOTLOADER=`sudo dd if=/dev/sda bs=512 count=1 2>/dev/null | strings | grep -i grub`
echo "4.Bootloader is: $BOOTLOADER"
if [ $BOOTLOADER == $prerequisite ]
then
echo "pass"
else
echo "fail"
fi
echo "****************************"
