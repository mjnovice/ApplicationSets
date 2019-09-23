#!/bin/bash
cnt=$(($1-1))
for (( i=$cnt; i>=0; i-- )); do 
ssh pc$i << EOF
sudo su
echo "CONF_SWAPSIZE=0" >> /etc/dphys-swapfile
sudo reboot
EOF
echo "Iteration"$i
done

