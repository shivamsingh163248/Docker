@echo off
echo ==================================================
echo        Cleaning Up All Containers - LAB2
echo ==================================================

echo Stopping all containers...
docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux

echo Removing all containers...
docker rm nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux

echo Removing all images...
docker rmi my-app-alpine my-app-ubuntu my-app-debian my-app-centos my-app-amazonlinux

echo ==================================================
echo Cleanup completed!
echo ==================================================
