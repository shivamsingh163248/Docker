<# LAB2 - Build Images (PowerShell) #>
Write-Host "Building all LAB2 images from LAB2 root directory..." -ForegroundColor Cyan

Push-Location ..\..
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to change directory to LAB2 root" -ForegroundColor Red
    Exit 1
}

Write-Host "Building Alpine version..."
docker build -f Dockerfile.alpine -t my-app-alpine .
if ($LASTEXITCODE -ne 0) { Write-Host "Error building my-app-alpine" -ForegroundColor Yellow }

Write-Host "Building Ubuntu version..."
docker build -f Dockerfile.ubuntu -t my-app-ubuntu .
if ($LASTEXITCODE -ne 0) { Write-Host "Error building my-app-ubuntu" -ForegroundColor Yellow }

Write-Host "Building Debian version..."
docker build -f Dockerfile.debian -t my-app-debian .
if ($LASTEXITCODE -ne 0) { Write-Host "Error building my-app-debian" -ForegroundColor Yellow }

Write-Host "Building CentOS version..."
docker build -f Dockerfile.centos -t my-app-centos .
if ($LASTEXITCODE -ne 0) { Write-Host "Error building my-app-centos" -ForegroundColor Yellow }

Write-Host "Building Amazon Linux version..."
docker build -f Dockerfile.amazonlinux -t my-app-amazonlinux .
if ($LASTEXITCODE -ne 0) { Write-Host "Error building my-app-amazonlinux" -ForegroundColor Yellow }

Pop-Location
Write-Host "Build script finished."
docker images | Where-Object { $_.Repository -like 'my-app*' } | Format-Table -AutoSize
