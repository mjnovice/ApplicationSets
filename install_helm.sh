#!/bin/bash
sudo apt-get install snap
snap install helm --classic
echo "PATH=$PATH:/snap/bin" >> ~/.bashrc
source ~/.bashrc
helm init --tiller-image=jessestuart/tiller
