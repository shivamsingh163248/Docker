@echo off
echo ==================================================
echo       Building All Docker Images - LAB2
echo ==================================================

echo Building Alpine version...
docker build -f Dockerfile.alpine -t my-app-alpine .

echo Building Ubuntu version...
docker build -f Dockerfile.ubuntu -t my-app-ubuntu .

echo Building Debian version...
docker build -f Dockerfile.debian -t my-app-debian .

echo Building CentOS version...
docker build -f Dockerfile.centos -t my-app-centos .

echo Building Amazon Linux version...
docker build -f Dockerfile.amazonlinux -t my-app-amazonlinux .

echo ==================================================
echo All images built successfully!
echo ==================================================
docker images | grep my-app
