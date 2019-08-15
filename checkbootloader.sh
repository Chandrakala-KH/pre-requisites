#!/bin/bash
prerequisite=GRUB
BOOTLOADER=`sudo dd if=/dev/sda bs=512 count=1 2>/dev/null | strings | grep -i grub`
echo "Bootloader is: $BOOTLOADER"
if [ $BOOTLOADER == $prerequisite ]
then
echo "pass"
else
echo "fail"
fi
