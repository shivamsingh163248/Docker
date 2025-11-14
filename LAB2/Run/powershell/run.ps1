<# LAB2 - Run All Containers (PowerShell) #>
Write-Host "Starting all LAB2 containers..." -ForegroundColor Cyan
Push-Location ..\..

$containers = @("nginx-alpine", "nginx-ubuntu", "nginx-debian", "nginx-centos", "nginx-amazonlinux")
$images = @("my-app-alpine", "my-app-ubuntu", "my-app-debian", "my-app-centos", "my-app-amazonlinux")
$ports = @("8081", "8082", "8083", "8084", "8085")

for ($i = 0; $i -lt $containers.Length; $i++) {
    $containerName = $containers[$i]
    $imageName = $images[$i]
    $port = $ports[$i]
    
    Write-Host "Starting $containerName on $port..."
    
    # Check if container exists
    $existingContainer = docker ps -a --filter "name=$containerName" --format "{{.Names}}" 2>$null
    
    if ($existingContainer -eq $containerName) {
        # Container exists, just start it
        docker start $containerName 2>$null
    } else {
        # Container doesn't exist, create and run it
        docker run -d -p "${port}:80" --name $containerName $imageName 2>$null
    }
}

Write-Host "All containers started."
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
Pop-Location
