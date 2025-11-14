@echo off
title LAB2 - Cleanup (Batch)
color 0A
echo Cleaning up LAB2 containers and images...
pushd ..\..

echo Stopping containers...
docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux 2>nul
echo Removing containers...
docker rm nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux 2>nul
echo Removing images...
docker rmi my-app-alpine my-app-ubuntu my-app-debian my-app-centos my-app-amazonlinux 2>nul

echo Cleanup complete.
popd
pause
