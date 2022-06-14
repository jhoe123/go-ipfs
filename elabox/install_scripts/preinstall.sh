#!/bin/bash 

IPFS_PATH=/home/elabox/data/ipfs
export IPFS_PATH=$IPFS_PATH
mkdir $IPFS_PATH

if ! grep -q 'export IPFS_PATH' ~/.bashrc ; then
    printf "\nexport IPFS_PATH=$IPFS_PATH" >> ~/.bashrc
fi

# initialize
./ipfs init -p server