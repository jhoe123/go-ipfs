#!/bin/bash 

IPFS_PATH=/home/elabox/data/ipfs
config_path=$IPFS_PATH/config
export IPFS_PATH=$IPFS_PATH

if ! grep -q 'export IPFS_PATH' ~/.bashrc ; then
    printf "\nexport IPFS_PATH=$IPFS_PATH" >> ~/.bashrc
fi

# initialize
echo "intializing ipfs"
echo "y" | sudo apt install jq
./ipfs init -p server

# update config
tmp=$(mktemp)
config=$(jq '.API.HTTPHeaders."Access-Control-Allow-Methods" = ["GET","PUT","POST"]' $config_path)
config=$(echo $config | jq '.API.HTTPHeaders."Access-Control-Allow-Origin" = ["*"]')
config=$(echo $config | jq '.Addresses.API="/ip4/0.0.0.0/tcp/5001"')
echo $config | jq '.Addresses.Gateway="/ip4/0.0.0.0/tcp/5003"' > $tmp
sudo rsync $tmp $config_path

