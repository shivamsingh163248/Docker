# Docker LAB 2 - Multi-OS Nginx Containers

**Author:** Shivam Singh  
**Date:** November 14, 2025  
**Lab:** Running Nginx with HTML on Different Operating Systems

---

## 📋 Table of Contents

1. [Lab Overview](#lab-overview)
2. [Prerequisites](#prerequisites)
3. [Understanding Different OS Base Images](#understanding-different-os-base-images)
4. [Creating Multiple Dockerfiles](#creating-multiple-dockerfiles)
5. [Building All Images](#building-all-images)
6. [Running All Containers](#running-all-containers)
7. [Testing Different OS Versions](#testing-different-os-versions)
8. [Comparing Image Sizes](#comparing-image-sizes)
9. [Automation Scripts](#automation-scripts)
10. [OS Comparison Analysis](#os-comparison-analysis)
11. [Troubleshooting](#troubleshooting)
12. [Cleanup](#cleanup)
13. [Lab Completion](#lab-completion)

---

## Lab Overview

In this lab, we'll learn how to:
- 🐧 Run the same web application on different Linux distributions
- 📦 Compare image sizes across different OS base images
- 🚀 Understand the trade-offs between different operating systems
- 🛠️ Use automation scripts to manage multiple containers
- 📊 Analyze performance and resource usage differences

---

## Prerequisites

- ✅ Docker Desktop installed and running
- ✅ Completed LAB1 (Basic Docker concepts)
- ✅ HTML file ready (`index.html`)
- ✅ Basic understanding of Linux distributions

---

## Understanding Different OS Base Images

### 🐧 Linux Distribution Comparison

| Distribution | Size | Package Manager | Best Use Case | Stability |
|--------------|------|----------------|---------------|-----------|
| **Alpine Linux** | ~5MB | `apk` | Production, Microservices | High |
| **Ubuntu** | ~70MB | `apt-get` | Development, Testing | High |
| **Debian** | ~50MB | `apt-get` | Stable Production | Very High |
| **CentOS** | ~200MB | `dnf/yum` | Enterprise, RedHat Ecosystem | High |
| **Amazon Linux** | ~120MB | `yum` | AWS Deployment | High |

### Why Different OS Matter:

1. **Size Impact**: Smaller images = faster deployments
2. **Security**: Different update cycles and security patches
3. **Package Availability**: Some packages work better on specific distributions
4. **Enterprise Requirements**: Some organizations prefer specific distributions
5. **Cloud Optimization**: Cloud providers often optimize for specific distributions

---

## Creating Multiple Dockerfiles

We've created 5 different Dockerfiles for different operating systems:

### 📄 Dockerfile.alpine
```dockerfile
FROM nginx:alpine

# Copy your HTML file
COPY index.html /usr/share/nginx/html/

# Expose port
EXPOSE 80

# Start nginx (already configured in base image)
```

**Key Features:**
- ✅ Smallest size (~23MB total)
- ✅ Security-focused (minimal attack surface)
- ✅ Fast startup time
- ✅ Production-ready

### 📄 Dockerfile.ubuntu
```dockerfile
FROM ubuntu:20.04

# Update package manager and install nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your HTML file
COPY index.html /var/www/html/

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
```

**Key Features:**
- ✅ Developer-friendly
- ✅ Extensive package repository
- ✅ Great for debugging
- ⚠️ Larger size (~180MB total)

### 📄 Dockerfile.debian
```dockerfile
FROM debian:11

# Update package manager and install nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your HTML file
COPY index.html /var/www/html/

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
```

**Key Features:**
- ✅ Rock-solid stability
- ✅ Conservative updates
- ✅ Great for long-term support
- ⚠️ Medium size (~150MB total)

### 📄 Dockerfile.centos
```dockerfile
FROM centos:8

# Install nginx (CentOS 8 is EOL, so we need to change repos)
RUN cd /etc/yum.repos.d/ && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    dnf install -y nginx && \
    dnf clean all

# Copy your HTML file
COPY index.html /usr/share/nginx/html/

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
```

**Key Features:**
- ✅ Enterprise-grade
- ✅ RedHat ecosystem compatibility
- ⚠️ Largest size (~250MB total)
- ⚠️ CentOS 8 is End-of-Life (EOL)

### 📄 Dockerfile.amazonlinux
```dockerfile
FROM amazonlinux:2

# Install nginx
RUN yum update -y && \
    amazon-linux-extras install nginx1 -y && \
    yum clean all

# Copy your HTML file
COPY index.html /usr/share/nginx/html/

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
```

**Key Features:**
- ✅ AWS-optimized
- ✅ Great for cloud deployments
- ✅ Amazon support
- ⚠️ Medium-large size (~200MB total)

---

## Building All Images

### Manual Build Commands

```powershell
# Navigate to LAB2 directory
cd D:\Docker\LAB2

# Build Alpine version (smallest - ~23MB)
docker build -f Dockerfile.alpine -t my-app-alpine .

# Build Ubuntu version (~180MB)
docker build -f Dockerfile.ubuntu -t my-app-ubuntu .

# Build Debian version (~150MB)  
docker build -f Dockerfile.debian -t my-app-debian .

# Build CentOS version (~250MB)
docker build -f Dockerfile.centos -t my-app-centos .

# Build Amazon Linux version (~200MB)
docker build -f Dockerfile.amazonlinux -t my-app-amazonlinux .
```

### 🚀 Automated Build Script

Use the provided `build-all.bat` script:

```powershell
# Run the build script
.\build-all.bat
```

**What the script does:**
1. Builds all 5 Docker images sequentially
2. Tags them with descriptive names
3. Shows final image list with sizes

---

## Running All Containers

### Manual Run Commands

```powershell
# Run Alpine version on port 8081
docker run -d -p 8081:80 --name nginx-alpine my-app-alpine

# Run Ubuntu version on port 8082
docker run -d -p 8082:80 --name nginx-ubuntu my-app-ubuntu

# Run Debian version on port 8083
docker run -d -p 8083:80 --name nginx-debian my-app-debian

# Run CentOS version on port 8084
docker run -d -p 8084:80 --name nginx-centos my-app-centos

# Run Amazon Linux version on port 8085
docker run -d -p 8085:80 --name nginx-amazonlinux my-app-amazonlinux
```

### 🚀 Automated Run Script

Use the provided `run-all.bat` script:

```powershell
# Run all containers
.\run-all.bat
```

**Port Mapping:**
- Alpine: `http://localhost:8081`
- Ubuntu: `http://localhost:8082`  
- Debian: `http://localhost:8083`
- CentOS: `http://localhost:8084`
- Amazon Linux: `http://localhost:8085`

---

## Testing Different OS Versions

### 🌐 Browser Testing

Open each URL in your browser and verify they all show your HTML content:

1. **Alpine**: http://localhost:8081
2. **Ubuntu**: http://localhost:8082  
3. **Debian**: http://localhost:8083
4. **CentOS**: http://localhost:8084
5. **Amazon Linux**: http://localhost:8085

### 🔍 Container Inspection Commands

```powershell
# Check all running containers
docker ps

# Inspect specific container
docker inspect nginx-alpine

# Check logs for each container
docker logs nginx-alpine
docker logs nginx-ubuntu
docker logs nginx-debian
docker logs nginx-centos
docker logs nginx-amazonlinux

# Get shell access to compare OS inside containers
docker exec -it nginx-alpine sh      # Alpine uses 'sh'
docker exec -it nginx-ubuntu bash    # Ubuntu uses 'bash'
docker exec -it nginx-debian bash    # Debian uses 'bash'
docker exec -it nginx-centos bash    # CentOS uses 'bash'
docker exec -it nginx-amazonlinux bash # Amazon Linux uses 'bash'
```

### 📊 Performance Testing

```powershell
# Check resource usage for all containers
docker stats

# Check individual container stats
docker stats nginx-alpine --no-stream
docker stats nginx-ubuntu --no-stream
docker stats nginx-debian --no-stream  
docker stats nginx-centos --no-stream
docker stats nginx-amazonlinux --no-stream
```

---

## Comparing Image Sizes

### 📏 Size Comparison Command

```powershell
# Check image sizes
docker images | grep my-app
```

### Expected Results:

| Image | Size | Efficiency Rating |
|-------|------|------------------|
| `my-app-alpine` | ~23MB | ⭐⭐⭐⭐⭐ (Best) |
| `my-app-debian` | ~150MB | ⭐⭐⭐⭐ |
| `my-app-ubuntu` | ~180MB | ⭐⭐⭐ |
| `my-app-amazonlinux` | ~200MB | ⭐⭐ |
| `my-app-centos` | ~250MB | ⭐ (Largest) |

### 📈 Size Analysis

```powershell
# Detailed size breakdown
docker history my-app-alpine
docker history my-app-ubuntu
docker history my-app-debian
docker history my-app-centos
docker history my-app-amazonlinux
```

---

## Automation Scripts

We've created 3 automation scripts for easier management:

### 🔨 build-all.bat
- Builds all Docker images
- Shows progress for each build
- Displays final image list

### ▶️ run-all.bat
- Runs all containers on different ports
- Shows access URLs
- Lists running containers

### 🧹 cleanup.bat
- Stops all containers
- Removes all containers
- Removes all images
- Complete cleanup

### Usage:
```powershell
# Build everything
.\build-all.bat

# Run everything
.\run-all.bat

# Clean everything
.\cleanup.bat
```

---

## OS Comparison Analysis

### 📊 Detailed Comparison Table

| Aspect | Alpine | Ubuntu | Debian | CentOS | Amazon Linux |
|--------|--------|--------|--------|--------|--------------|
| **Base Size** | 5MB | 70MB | 50MB | 200MB | 120MB |
| **Final Size** | 23MB | 180MB | 150MB | 250MB | 200MB |
| **Package Manager** | apk | apt-get | apt-get | dnf/yum | yum |
| **Security Updates** | Weekly | Regular | Conservative | Enterprise | AWS-managed |
| **Startup Time** | Fastest | Fast | Fast | Slower | Fast |
| **Memory Usage** | Lowest | Medium | Medium | Higher | Medium |
| **Best For** | Production | Development | Stable Production | Enterprise | AWS Cloud |
| **Package Availability** | Limited | Extensive | Extensive | Enterprise | AWS-focused |

### 🎯 When to Use Each:

**Alpine Linux 🏔️**
- ✅ Production microservices
- ✅ Container orchestration (Kubernetes)
- ✅ Security-critical applications
- ✅ Resource-constrained environments

**Ubuntu 🟠**
- ✅ Development environments
- ✅ CI/CD pipelines
- ✅ Learning and experimentation
- ✅ Wide software compatibility needed

**Debian 🔵**
- ✅ Long-term stable deployments
- ✅ Conservative production environments
- ✅ When stability is priority over features
- ✅ Government/regulated environments

**CentOS/Rocky Linux 🔴**
- ✅ Enterprise environments
- ✅ RedHat ecosystem compatibility
- ✅ Legacy enterprise applications
- ✅ When RedHat support is needed

**Amazon Linux 🟡**
- ✅ AWS cloud deployments
- ✅ When using AWS services extensively
- ✅ Cost optimization on AWS
- ✅ Integration with AWS tools

---

## Troubleshooting

### Common Issues and Solutions:

| Problem | Symptoms | Solution |
|---------|----------|----------|
| **Port conflicts** | Container won't start | `docker ps` to find conflicts, change ports |
| **Build failures** | Docker build errors | Check Dockerfile syntax, internet connection |
| **Container not accessible** | Browser can't connect | Verify port mapping, check container status |
| **Out of disk space** | Build fails with space error | `docker system prune` to clean up |
| **Network issues** | Can't download packages | Check internet connection, proxy settings |

### Debug Commands:

```powershell
# Check Docker daemon status
docker version
docker system info

# View container logs
docker logs <container_name>

# Access container for debugging
docker exec -it <container_name> sh

# Check port conflicts
netstat -an | findstr :8080

# Check disk usage
docker system df

# Clean up space
docker system prune -a
```

---

## Cleanup

### 🧹 Manual Cleanup Commands

```powershell
# Stop all containers
docker stop nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux

# Remove all containers
docker rm nginx-alpine nginx-ubuntu nginx-debian nginx-centos nginx-amazonlinux

# Remove all images
docker rmi my-app-alpine my-app-ubuntu my-app-debian my-app-centos my-app-amazonlinux

# Clean up system (optional)
docker system prune -a
```

### 🚀 Automated Cleanup

```powershell
# Use the cleanup script
.\cleanup.bat
```

---

## Lab Completion

### 🎯 LAB 2 Completion Checklist

- [ ] ✅ Created 5 different Dockerfiles for different OS
- [ ] ✅ Built all 5 Docker images successfully
- [ ] ✅ Ran all containers on different ports
- [ ] ✅ Tested all web applications in browser
- [ ] ✅ Compared image sizes and analyzed differences
- [ ] ✅ Used automation scripts for build/run/cleanup
- [ ] ✅ Understood trade-offs between different OS choices
- [ ] ✅ Accessed containers via shell to explore OS differences
- [ ] ✅ Monitored resource usage across different containers
- [ ] ✅ Successfully cleaned up all containers and images

### 📊 Performance Comparison Results

Fill in your results after testing:

| OS | Image Size | Startup Time | Memory Usage | CPU Usage |
|----|-----------|--------------|--------------|-----------|
| Alpine | ___MB | ___s | ___MB | __% |
| Ubuntu | ___MB | ___s | ___MB | __% |
| Debian | ___MB | ___s | ___MB | __% |
| CentOS | ___MB | ___s | ___MB | __% |
| Amazon Linux | ___MB | ___s | ___MB | __% |

### 🏆 Key Learnings from LAB 2

1. **Size Matters**: Alpine is significantly smaller and faster
2. **Trade-offs**: Smaller images may have fewer packages available
3. **Use Case Driven**: Choose OS based on your specific requirements
4. **Automation**: Scripts make multi-container management easier
5. **Resource Awareness**: Different OS have different resource footprints

**Congratulations! 🎉** You've successfully completed Docker LAB 2 and learned how to work with multiple operating systems in containers!

---

## 📚 Additional Resources

- [Alpine Linux Docker Hub](https://hub.docker.com/_/alpine)
- [Ubuntu Docker Hub](https://hub.docker.com/_/ubuntu)
- [Debian Docker Hub](https://hub.docker.com/_/debian)
- [CentOS Alternatives (Rocky Linux)](https://hub.docker.com/_/rockylinux)
- [Amazon Linux Docker Hub](https://hub.docker.com/_/amazonlinux)
- [Docker Multi-stage Builds](https://docs.docker.com/develop/dev-best-practices/)

---

**Next Lab Preview:** In Lab 3, we'll explore:
- Multi-stage Docker builds
- Environment variables and configuration
- Docker networking
- Container orchestration basics
- Security best practices

---

*Keep Dockerizing! 🐳*
