# Use docker download file over China GFW
name: ci
on:
  push:
#    branches: main
jobs:
  docker-image-transfer:
    runs-on: ubuntu-latest
    steps:
      - name: run linux command
        run: |
          echo "Hostname: "`hostname`
          echo "Kernel info: "`uname -a`  
      - name: Check out repository code
        uses: actions/checkout@v3
      - name: Login to Docker Hub
        uses: docker/login-action@f054a8b539a109f9f41c372932f1ae047eff08c9
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      - name: download glibc for alpine linux 
        run: | 
          sh glibc4alpine.sh
      - name: query docker images
        run: docker images
      - name: docker push
        run: |
          docker commit busybox ${{secrets.DOCKERHUB_REPONAME}}/busybox-glibc
          docker push ${{secrets.DOCKERHUB_REPONAME}}/busybox-glibc

