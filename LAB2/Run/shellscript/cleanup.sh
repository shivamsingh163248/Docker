#!/usr/bin/env bash
set +e

echo "Cleaning up LAB2 containers and images..."
cd ../../

echo "Stopping containers..."
docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux || true

echo "Removing containers..."
docker rm nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux || true

echo "Removing images..."
docker rmi my-app-alpine my-app-ubuntu my-app-debian my-app-centos my-app-amazonlinux || true

echo "Cleanup complete."