#!/bin/bash
cnt=$(($1-1))
for i in $(seq $cnt -1 1)
do
sshpass -p picocluster scp -oStrictHostKeyChecking=no linux-headers-pi.deb linux-image-pi.deb picocluster@pc$i:/tmp
sshpass -p picocluster ssh -oStrictHostKeyChecking=no  picocluster@pc$i << EOF
sudo su
dpkg -i /tmp/linux-image-pi.deb
dpkg -i /tmp/linux-headers-pi.deb
cp /boot/vmlinuz-4.19.73-custom-v7l+ /boot/kernel7.img
cp /boot/vmlinuz-4.19.73-custom-v7l+ /boot/kernel7l.img
reboot
EOF
done
