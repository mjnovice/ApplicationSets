#!/bin/bash
d 'cnt=$(($1-1))
for i in $(seq $cnt -1 1)
do
'
i=9
sshpass -p picocluster scp -oStrictHostKeyChecking=no linux-custom-headers.deb linux-custom-image.deb picocluster@pc$i:/tmp
sshpass -p picocluster ssh -oStrictHostKeyChecking=no  picocluster@pc$i << EOF
sudo su
dpkg -i /tmp/linux-custom-image.deb
dpkg -i /tmp/linux-custom-headers.deb
cp /boot/vmlinuz-4.9.140-custom /boot/Image
reboot
EOF
#done
