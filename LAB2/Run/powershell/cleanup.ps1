<# LAB2 - Cleanup (PowerShell) #>
Write-Host "Cleaning up LAB2 containers and images..." -ForegroundColor Cyan
Push-Location ..\..

Write-Host "Stopping containers..."
docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux -ErrorAction SilentlyContinue

Write-Host "Removing containers..."
docker rm nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux -ErrorAction SilentlyContinue

Write-Host "Removing images..."
docker rmi my-app-alpine my-app-ubuntu my-app-debian my-app-centos my-app-amazonlinux -ErrorAction SilentlyContinue

Write-Host "Cleanup complete."
Pop-Location
