<# LAB2 - Stop Containers (PowerShell) #>
Write-Host "Stopping LAB2 containers..." -ForegroundColor Cyan
Push-Location ..\..

docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux -ErrorAction SilentlyContinue

Write-Host "Done stopping containers."
Pop-Location
