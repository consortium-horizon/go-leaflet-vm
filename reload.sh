#!/usr/bin/env bash
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/vagrant/go
cd ~/code/go-leaflet
go build go-leaflet.go
screen -d -m /home/vagrant/code/go-leaflet/go-leaflet