<# LAB2 - Cleanup (PowerShell) #>
Write-Host "Cleaning up LAB2 containers and images..." -ForegroundColor Cyan
Push-Location ..\..

Write-Host "Stopping containers..."
try { docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux 2>$null } catch { }

Write-Host "Removing containers..."
try { docker rm nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux 2>$null } catch { }

Write-Host "Removing images..."
try { docker rmi my-app-alpine my-app-ubuntu my-app-debian my-app-centos my-app-amazonlinux 2>$null } catch { }

Write-Host "Cleanup complete."
Pop-Location
