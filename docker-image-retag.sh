#!/bin/bash

VERSION=v0.36.0
docker pull gcr.io/cadvisor/cadvisor:$VERSION
docker tag gcr.io/cadvisor/cadvisor:$VERSION ehongping/cadvisor/cadvisor:$VERSION
docker push ehongping/cadvisor/cadvisor:$VERSION
