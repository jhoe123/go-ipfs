#!/bin/bash 

IPFS_PATH=/home/elabox/data/ipfs
export IPFS_PATH=$IPFS_PATH

if ! grep -q 'export IPFS_PATH' ~/.bashrc ; then
    printf "\nexport IPFS_PATH=$IPFS_PATH" >> ~/.bashrc
fi

# initialize
echo "intializing ipfs"
./ipfs init -p server