#!/bin/bash

# docker tag
awk -F: '{print $1,$2}'  k8s-image.txt|while read name tag ; do docker tag $name:$tag ehongping/${name##*/}:$tag; done
# docker push 
docker images|awk '/ehongping/{print $1,$2}'|while read name tag; do docker push  $name:$tag; done
