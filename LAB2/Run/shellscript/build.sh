#!/usr/bin/env bash
set -e

echo "Building all LAB2 images from LAB2 root directory..."
cd ../../

echo "Building Alpine version..."
docker build -f Dockerfile.alpine -t my-app-alpine . || echo "Error building my-app-alpine"

echo "Building Ubuntu version..."
docker build -f Dockerfile.ubuntu -t my-app-ubuntu . || echo "Error building my-app-ubuntu"

echo "Building Debian version..."
docker build -f Dockerfile.debian -t my-app-debian . || echo "Error building my-app-debian"

echo "Building CentOS version..."
docker build -f Dockerfile.centos -t my-app-centos . || echo "Error building my-app-centos"

echo "Building Amazon Linux version..."
docker build -f Dockerfile.amazonlinux -t my-app-amazonlinux . || echo "Error building my-app-amazonlinux"

echo "Build script finished."
docker images | grep my-app || true