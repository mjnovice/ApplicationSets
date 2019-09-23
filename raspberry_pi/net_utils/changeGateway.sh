#!/bin/bash

# The number of nodes
cnt=$(expr $1 - 1)

# Define up new gateway
gateway_origin=10.1.10.1
gateway_new=10.0.1.1

ip_format_old=10.1.10.24
ip_format_new=10.0.1.4
# From last node to head node
for i in $(seq $cnt -1 0)
do

sshpass -p picocluster ssh -oStrictHostKeyChecking=no picocluster@pc$i << EOF
sudo su
echo "Iteration: "$i"This is host "`hostname`
cp /etc/network/interfaces /etc/network/interfaces.copy
sed -i 's/${ip_format_old}/${ip_format_new}/g' /etc/network/interfaces
sed -i 's/${gateway_origin}/${gateway_new}/g' /etc/network/interfaces
cat /etc/network/interfaces
#applying the config
init 6
EOF
done

#modifying /etc/hosts file
sudo sed -i 's/${ip_format_old}/${ip_format_new}/g' /etc/hosts
cat /etc/hosts
exit 1

