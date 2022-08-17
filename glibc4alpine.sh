mkdir -p /download    
wget -O /download/glibc-2.35-r0.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-2.35-r0.apk 
    wget -O /download/glibc-bin-2.35-r0.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-bin-2.35-r0.apk 
    wget -O /download/glibc-i18n-2.35-r0.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-i18n-2.35-r0.apk 


docker run -d --name busybox busybox sleep infinity
docker cp download busybox:/
docker commit busybox ${{secrets.DOCKERHUB_REPONAME}}/busybox-glibc
docker push ${{secrets.DOCKERHUB_REPONAME}}/busybox-glibc

