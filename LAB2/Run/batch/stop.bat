@echo off
title LAB2 - Stop Containers (Batch)
color 0A
echo Stopping LAB2 containers...
pushd ..\..

docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux
if %ERRORLEVEL% neq 0 (
  echo Some containers failed to stop or were not running.
)

echo Done stopping containers.
popd
pause
