for i in {1..9};do 
ssh pc$i << EOF
sudo su
echo '{"insecure-registries":["0.0.0.0:5000","10.0.1.240:5000"] }'>/etc/docker/daemon.json
EOF
done

