#!/bin/bash

target=$(go env GOOS)
arch=$(go env GOARCH)

while getopts o:a:d: flag
do
    case "${flag}" in
        o) target=${OPTARG};;
        a) arch=${OPTARG};;
    esac
done

cd ..
make build GOOS=$target GOARCH=$arch
cp ./cmd/ipfs/ipfs ./elabox/bin/ipfs
packager ./elabox/packager.json