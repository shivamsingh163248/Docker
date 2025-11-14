#!/usr/bin/env bash
set -e

echo "Running all LAB2 containers..."
cd ../../

docker run -d -p 8081:80 --name nginx-alpine my-app-alpine || echo "Failed to run my-app-alpine"
docker run -d -p 8082:80 --name nginx-ubuntu my-app-ubuntu || echo "Failed to run my-app-ubuntu"
docker run -d -p 8083:80 --name nginx-debian my-app-debian || echo "Failed to run my-app-debian"
docker run -d -p 8084:80 --name nginx-centos my-app-centos || echo "Failed to run my-app-centos"
docker run -d -p 8085:80 --name nginx-amazonlinux my-app-amazonlinux || echo "Failed to run my-app-amazonlinux"

echo "All containers attempted to start."
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"