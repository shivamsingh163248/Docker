@echo off
title LAB2 - Run All Containers (Batch)
color 0A
echo Starting all LAB2 containers (Alpine, Ubuntu, Debian, CentOS, Amazon Linux)...
pushd ..\..

echo Starting containers (creating or starting existing)...
docker start nginx-alpine 2>nul || docker run -d -p 8081:80 --name nginx-alpine my-app-alpine
docker start nginx-ubuntu 2>nul || docker run -d -p 8082:80 --name nginx-ubuntu my-app-ubuntu
docker start nginx-debian 2>nul || docker run -d -p 8083:80 --name nginx-debian my-app-debian
docker start nginx-centos 2>nul || docker run -d -p 8084:80 --name nginx-centos my-app-centos
docker start nginx-amazonlinux 2>nul || docker run -d -p 8085:80 --name nginx-amazonlinux my-app-amazonlinux

echo All containers started.
docker ps --format "table {{.Names}}	{{.Image}}	{{.Status}}	{{.Ports}}"
popd
pause
