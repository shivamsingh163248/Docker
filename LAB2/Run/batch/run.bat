@echo off
title LAB2 - Run All Containers (Batch)
color 0A
echo Starting all LAB2 containers (Alpine, Ubuntu, Debian, CentOS, Amazon Linux)...
pushd ..\..

echo Running Alpine on 8081...
docker run -d -p 8081:80 --name nginx-alpine my-app-alpine
echo Running Ubuntu on 8082...
docker run -d -p 8082:80 --name nginx-ubuntu my-app-ubuntu
echo Running Debian on 8083...
docker run -d -p 8083:80 --name nginx-debian my-app-debian
echo Running CentOS on 8084...
docker run -d -p 8084:80 --name nginx-centos my-app-centos
echo Running Amazon Linux on 8085...
docker run -d -p 8085:80 --name nginx-amazonlinux my-app-amazonlinux

echo All containers started.
docker ps --format "table {{.Names}}	{{.Image}}	{{.Status}}	{{.Ports}}"
popd
pause
