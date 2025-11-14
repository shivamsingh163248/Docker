@echo off
echo ==================================================
echo     Starting All Containers - LAB2
echo ==================================================

docker run -d -p 8081:80 --name nginx-alpine my-app-alpine
docker run -d -p 8082:80 --name nginx-ubuntu my-app-ubuntu
docker run -d -p 8083:80 --name nginx-debian my-app-debian
docker run -d -p 8084:80 --name nginx-centos my-app-centos
docker run -d -p 8085:80 --name nginx-amazonlinux my-app-amazonlinux

echo ==================================================
echo All containers started!
echo ==================================================
echo Alpine:       http://localhost:8081
echo Ubuntu:       http://localhost:8082
echo Debian:       http://localhost:8083
echo CentOS:       http://localhost:8084
echo Amazon Linux: http://localhost:8085
echo ==================================================

echo Current running containers:
docker ps
