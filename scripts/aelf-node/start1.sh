#!/bin/bash
ip=`ip a | grep eth0 |grep 'inet' | awk -F/ '{print $1}'| awk '{print $2}'`
dir=`pwd`
echo $dir
sudo apt install unzip
sudo mkdir -p /home/ubuntu/.ssh/aelf/keys
sudo mkdir -p /root/.ssh/aelf/keys
cd /home/vsts/work/1/s/
wget https://github.com/AElfProject/AElf/releases/download/v1.0.0-preview1/aelf.zip -o aelf.zip && unzip aelf.zip -d aelf
sudo cp scripts/aelf-node/keys/SD6BXDrKT2syNd1WehtPyRo3dPBiXqfGUj8UJym7YP9W9RynM.json  /home/ubuntu/.ssh/aelf/keys
sudo cp scripts/aelf-node/keys/SD6BXDrKT2syNd1WehtPyRo3dPBiXqfGUj8UJym7YP9W9RynM.json  /root/.ssh/aelf/keys
sudo cp scripts/aelf-node/app* aelf/
echo "start node"
cd aelf && sudo dotnet AElf.Launcher.dll >/dev/null 2>&1 &
height=`curl -s http://$ip:8001/api/blockChain/blockHeight`
echo "height is $height"
