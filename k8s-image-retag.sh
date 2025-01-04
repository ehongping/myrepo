#!/bin/bash

# docker pull
awk -F: '{print $1,$2}'  k8s-image.txt|while read name tag ; do docker pull $name:$tag ;done
# docker tag,coredns/coredns denied: requested access to the resource is denied
awk -F: '{print $1,$2}'  k8s-image.txt|while read name tag ; do docker tag $name:$tag ehongping/${name##*/}:$tag; done
# docker push 
docker images|awk '/ehongping/{print $1,$2}'|while read name tag; do docker push  $name:$tag; done
