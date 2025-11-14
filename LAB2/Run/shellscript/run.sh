#!/usr/bin/env bash
set -e

echo "Running all LAB2 containers..."
cd ../../

docker start nginx-alpine 2>/dev/null || docker run -d -p 8081:80 --name nginx-alpine my-app-alpine
docker start nginx-ubuntu 2>/dev/null || docker run -d -p 8082:80 --name nginx-ubuntu my-app-ubuntu
docker start nginx-debian 2>/dev/null || docker run -d -p 8083:80 --name nginx-debian my-app-debian
docker start nginx-centos 2>/dev/null || docker run -d -p 8084:80 --name nginx-centos my-app-centos
docker start nginx-amazonlinux 2>/dev/null || docker run -d -p 8085:80 --name nginx-amazonlinux my-app-amazonlinux

echo "All containers attempted to start."
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"