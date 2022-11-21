#!/bin/bash

VER=v1.10.6
wget https://raw.githubusercontent.com/rook/rook/v1.10.6/deploy/examples/images.txt -O rook-images.txt
# docker pull
awk -F: '{print $1,$2}'  rook-images.txt|while read name tag ; do docker pull $name:$tag ;done
# docker tag
awk -F: '{print $1,$2}'  rook-images.txt|while read name tag ; do docker tag $name:$tag ehongping/${name##*/}:$tag; done
# docker push 
docker images|awk '/ehongping/{print $1,$2}'|while read name tag; do docker push  $name:$tag; done
