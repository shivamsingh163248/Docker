<# LAB2 - Run All Containers (PowerShell) #>
Write-Host "Starting all LAB2 containers..." -ForegroundColor Cyan
Push-Location ..\..

Write-Host "Running Alpine on 8081..."
docker run -d -p 8081:80 --name nginx-alpine my-app-alpine
Write-Host "Running Ubuntu on 8082..."
docker run -d -p 8082:80 --name nginx-ubuntu my-app-ubuntu
Write-Host "Running Debian on 8083..."
docker run -d -p 8083:80 --name nginx-debian my-app-debian
Write-Host "Running CentOS on 8084..."
docker run -d -p 8084:80 --name nginx-centos my-app-centos
Write-Host "Running Amazon Linux on 8085..."
docker run -d -p 8085:80 --name nginx-amazonlinux my-app-amazonlinux

Write-Host "All containers started."
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
Pop-Location
