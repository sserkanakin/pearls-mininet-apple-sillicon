#!/bin/bash

QTR=21wi
MININET_VERSION="2.3.1b1"
POX_VERSION=fangtooth

sudo apt-get --allow-releaseinfo-change update
sudo apt-get update
sudo apt install git
git clone https://github.com/mininet/mininet
(cd mininet && git checkout $MININET_VERSION)
sed -i 's/cgroup-bin/cgroup-tools/g' mininet/util/install.sh
sudo PYTHON=python2 mininet/util/install.sh -nfvp
(cd pox && sudo git checkout $POX_VERSION)
cd ..
unzip pearls_mininet.zip
sudo ln -s ~/pearls_mininet/pox/* ~/pox/pox/misc/
