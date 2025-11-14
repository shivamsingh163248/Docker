@echo off
title LAB2 - Build Images (Batch)
color 0A
echo Building all LAB2 images from LAB2 root directory...
pushd ..\..
if %ERRORLEVEL% neq 0 (
  echo Failed to change directory to LAB2 root
  pause
  exit /b 1
)
echo Current folder: %CD%

echo Building Alpine version...
docker build -f Dockerfile.alpine -t my-app-alpine .
if %ERRORLEVEL% neq 0 (
  echo Error building my-app-alpine
)
echo Building Ubuntu version...
docker build -f Dockerfile.ubuntu -t my-app-ubuntu .
if %ERRORLEVEL% neq 0 (
  echo Error building my-app-ubuntu
)
echo Building Debian version...
docker build -f Dockerfile.debian -t my-app-debian .
if %ERRORLEVEL% neq 0 (
  echo Error building my-app-debian
)
echo Building CentOS version...
docker build -f Dockerfile.centos -t my-app-centos .
if %ERRORLEVEL% neq 0 (
  echo Error building my-app-centos
)
echo Building Amazon Linux version...
docker build -f Dockerfile.amazonlinux -t my-app-amazonlinux .
if %ERRORLEVEL% neq 0 (
  echo Error building my-app-amazonlinux
)
popd
echo Build script finished.
docker images | findstr my-app
pause
