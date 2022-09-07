#!/bin/bash

# docker tag
awk -F: '{print $1,$2}'  /tmp/k8s.list|while read name tag ; do docker tag $name:$tag ehongping/${name##*/}:$tag; done
# docker push 
docker images|awk '/ehongping/{print $1,$2}'|while read name tag; do docker push  $name:$tag; done
