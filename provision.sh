#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

rm -f /etc/network/interfaces.d/eth1.cfg
echo "auto eth1" >> /etc/network/interfaces.d/eth1.cfg
echo "iface eth1 inet static" >> /etc/network/interfaces.d/eth1.cfg
echo "address 192.168.35.25" >> /etc/network/interfaces.d/eth1.cfg
echo "netmask 255.255.255.0" >> /etc/network/interfaces.d/eth1.cfg
ifdown eth1 && ifup eth1

sudo aptitude update -q

#install git
# sudo aptitude install -q -y -f build-essential
sudo aptitude install -q -y -f git

# clone the repo if it isn't already in the shared folder
git clone https://github.com/consortium-horizon/go-leaflet.git /home/vagrant/code/go-leaflet || true

# get go and set env
curl -o /tmp/go1.6.linux-386.tar.gz https://storage.googleapis.com/golang/go1.6.linux-386.tar.gz
cd /tmp
tar -xvf go1.6.linux-386.tar.gz
sudo mv go /usr/local/
echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.profile
echo 'export GOPATH=/home/vagrant/go' >> /home/vagrant/.profile
mkdir -p /home/vagrant/go

# provision is launched as root so we have to set env manually
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/vagrant/go

# go dependencies
go get github.com/gin-gonic/gin
chmod -R 777 /home/vagrant/go
