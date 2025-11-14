#!/usr/bin/env bash
set +e

echo "Stopping LAB2 containers..."
cd ../../

docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux || true

echo "Stopped (if running)."