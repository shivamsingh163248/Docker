<# LAB2 - Stop Containers (PowerShell) #>
Write-Host "Stopping LAB2 containers..." -ForegroundColor Cyan
Push-Location ..\..

try {
    docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux 2>$null
} catch {
    Write-Host "Some containers may not have been running" -ForegroundColor Yellow
}

Write-Host "Done stopping containers."
Pop-Location
