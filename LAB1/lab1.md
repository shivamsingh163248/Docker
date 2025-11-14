# Docker Learning - Step by Step Guide (LAB 1)

**Author:** Shivam Singh  
**Date:** November 14, 2025  
**Lab:** Docker Basics and First Web Application

---

## 📋 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Step 1: Verify Docker Installation](#step-1-verify-docker-installation)
3. [Step 2: Understanding Docker Basics](#step-2-understanding-docker-basics)
4. [Step 3: Your First Docker Command](#step-3-your-first-docker-command)
5. [Step 4: Working with Images](#step-4-working-with-images)
6. [Step 5: Running Your First Web Server](#step-5-running-your-first-web-server)
7. [Step 6: Managing Containers](#step-6-managing-containers)
8. [Step 7: Create Your First Dockerfile](#step-7-create-your-first-dockerfile)
9. [Step 8: Build and Run Your Custom Image](#step-8-build-and-run-your-custom-image)
10. [Common Commands Cheat Sheet](#common-commands-cheat-sheet)
11. [Next Steps](#next-steps)
12. [Troubleshooting](#troubleshooting)

---

## Prerequisites

- ✅ Docker Desktop installed and running on Windows
- ✅ Basic command line knowledge
- ✅ Text editor (VS Code recommended)

---

## Step 1: Verify Docker Installation

First, let's confirm Docker is working properly on your system:

```powershell
# Check Docker version
docker --version

# Check if Docker is running and get system info
docker info

# Check Docker Compose version (comes with Docker Desktop)
docker-compose --version
```

**Expected Output:**
```
Docker version 24.x.x, build xxxxxxx
```

---

## Step 2: Understanding Docker Basics

### What is Docker?
Docker is a containerization platform that packages applications and their dependencies into lightweight, portable containers. Containers are isolated environments that run consistently across different systems.

### Key Concepts:

| Term | Definition |
|------|------------|
| **Image** | A template/blueprint for creating containers (like a class in programming) |
| **Container** | A running instance of an image (like an object in programming) |
| **Dockerfile** | A text file with instructions to build an image |
| **Registry** | Storage for Docker images (like Docker Hub, AWS ECR) |
| **Port Mapping** | Connecting host ports to container ports |
| **Volume** | Persistent data storage for containers |

### Docker Architecture:
```
┌─────────────────────────────────────────────┐
│                Docker Host                  │
│  ┌─────────────┐  ┌─────────────┐         │
│  │ Container 1 │  │ Container 2 │   ...   │
│  └─────────────┘  └─────────────┘         │
│  ┌─────────────────────────────────────┐   │
│  │         Docker Engine              │   │
│  └─────────────────────────────────────┘   │
│  ┌─────────────────────────────────────┐   │
│  │         Host OS (Windows)          │   │
│  └─────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
```

---

## Step 3: Your First Docker Command

Let's run your first container:

```powershell
# Run the famous Hello World container
docker run hello-world
```

**What happens:**
1. 🔍 Docker searches for `hello-world` image locally
2. 📥 Downloads the image from Docker Hub (if not found locally)
3. 🚀 Creates and runs a container from that image
4. 📝 Shows a welcome message
5. 🛑 Container stops automatically after completing its task

---

## Step 4: Working with Images

### Image Management Commands:

```powershell
# List all downloaded images on your system
docker images

# Pull an image without running it
docker pull nginx

# Pull a specific version/tag
docker pull nginx:alpine

# Search for images on Docker Hub
docker search nginx

# Get detailed information about an image
docker inspect nginx

# Remove an image (no containers using it should be running)
docker rmi nginx
```

### Understanding Image Tags:
```
nginx:latest    # Latest stable version (default)
nginx:alpine    # Smaller, Alpine Linux based version
nginx:1.21      # Specific version
```

---

## Step 5: Running Your First Web Server

Let's run a real web server:

```powershell
# Run Nginx web server in detached mode
docker run -d -p 8080:80 --name my-nginx nginx
```

**Parameter Breakdown:**
- `-d`: **Detached mode** - runs in background
- `-p 8080:80`: **Port mapping** - maps host port 8080 to container port 80
- `--name my-nginx`: **Custom name** - easier to reference than container ID
- `nginx`: **Image name** - the base image to use

**Test it:** Open browser and navigate to `http://localhost:8080`

You should see the **Nginx welcome page**! 🎉

---

## Step 6: Managing Containers

### Container Lifecycle Commands:

```powershell
# List currently running containers
docker ps

# List all containers (including stopped ones)
docker ps -a

# Stop a running container
docker stop my-nginx

# Start a stopped container
docker start my-nginx

# Restart a container
docker restart my-nginx

# View container logs
docker logs my-nginx

# Follow logs in real-time
docker logs -f my-nginx

# Execute commands inside running container
docker exec -it my-nginx bash

# Remove a container (must be stopped first)
docker stop my-nginx
docker rm my-nginx

# Force remove a running container
docker rm -f my-nginx
```

### Container States:
```
Created → Running → Stopped → Removed
    ↑         ↓         ↑
    └─── Restarted ────┘
```

---

## Step 7: Create Your First Dockerfile

Now let's create our custom web application! We already have the files in this directory:

### 📄 Dockerfile
```dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/
EXPOSE 80
```

### 📄 index.html
```html
<!DOCTYPE html>
<html>
<head>
    <title>My First Docker App My name is shivam singh</title>
</head>
<body>
    <h1>Hello from Docker!</h1>
    <p>This is my first containerized web application.</p>
</body>
</html>
```

### Dockerfile Explanation:

| Instruction | Purpose |
|-------------|---------|
| `FROM nginx:alpine` | Use Nginx on Alpine Linux as base image (smaller size) |
| `COPY index.html /usr/share/nginx/html/` | Copy our HTML file to Nginx's default directory |
| `EXPOSE 80` | Document that container will listen on port 80 |

---

## Step 8: Build and Run Your Custom Image

### Build Your Custom Image:

```powershell
# Build image from Dockerfile in current directory
docker build -t my-first-app .

# Build with verbose output
docker build -t my-first-app:v1.0 . --no-cache
```

**Parameters:**
- `-t my-first-app`: **Tag** the image with a name
- `.`: **Build context** - current directory
- `--no-cache`: Build without using cache (for clean builds)

### Run Your Custom Container:

```powershell
# Run your custom application
docker run -d -p 8080:80 --name shivam-app my-first-app

# Check if it's running
docker ps
```

**Test Your App:** Visit `http://localhost:8080` to see your personalized page! 🌟

### Advanced Run Options:

```powershell
# Run with environment variables
docker run -d -p 8080:80 -e ENV=production --name my-app my-first-app

# Run with volume mounting (for development)
docker run -d -p 8080:80 -v ${PWD}:/usr/share/nginx/html --name dev-app nginx

# Run with custom network
docker network create my-network
docker run -d -p 8080:80 --network my-network --name networked-app my-first-app
```

---

## Common Commands Cheat Sheet

### 🐳 Container Management
```powershell
docker run <image>              # Create and run container
docker start <container>        # Start stopped container  
docker stop <container>         # Stop running container
docker restart <container>      # Restart container
docker rm <container>           # Remove container
docker logs <container>         # View container logs
docker exec -it <container> sh  # Access container shell
docker inspect <container>      # Detailed container info
```

### 🖼️ Image Management
```powershell
docker images                   # List all images
docker pull <image>             # Download image
docker build -t <name> .        # Build image from Dockerfile
docker rmi <image>              # Remove image
docker tag <image> <new_tag>    # Tag an image
docker push <image>             # Push to registry
docker history <image>          # Show image layers
```

### 🧹 Cleanup Commands
```powershell
docker system prune             # Remove unused containers, networks, images
docker container prune          # Remove stopped containers
docker image prune              # Remove dangling images
docker volume prune             # Remove unused volumes
docker system df                # Show disk usage
```

### 🔍 Information Commands
```powershell
docker version                  # Docker version info
docker info                     # System-wide information
docker stats                    # Live resource usage stats
docker top <container>          # Process info in container
```

---

## Next Steps to Practice

### Beginner Level:
1. **Try Different Base Images:**
   ```powershell
   docker run -it node:alpine sh       # Node.js environment
   docker run -it python:3.9 python   # Python environment  
   docker run -it ubuntu:latest bash   # Ubuntu environment
   ```

2. **Experiment with Port Mapping:**
   ```powershell
   docker run -d -p 3000:80 nginx      # Different host port
   docker run -d -P nginx              # Random port assignment
   ```

3. **Practice Container Management:**
   - Create multiple containers
   - Start/stop them in different orders
   - View logs and inspect configurations

### Intermediate Level:
4. **Multi-stage Builds:** Create optimized images
5. **Docker Compose:** Manage multi-container applications
6. **Volumes and Networking:** Persistent data and container communication
7. **Environment Variables:** Configure containers dynamically

---

## Troubleshooting

### Common Issues and Solutions:

| Problem | Solution |
|---------|----------|
| **Port already in use** | `docker ps` to find conflicting container, then `docker stop <container>` |
| **Image not found** | Check spelling, try `docker pull <image>` first |
| **Container won't start** | Check logs with `docker logs <container>` |
| **Permission denied** | Make sure Docker Desktop is running |
| **Build fails** | Check Dockerfile syntax and file paths |

### Useful Debug Commands:
```powershell
# Check Docker daemon status
docker system info

# See what's consuming space
docker system df

# View detailed container information
docker inspect <container_name>

# Check container resource usage
docker stats <container_name>
```

---

## 🎯 Lab 1 Completion Checklist

- [ ] ✅ Verified Docker installation
- [ ] ✅ Ran `hello-world` container
- [ ] ✅ Pulled and ran Nginx image
- [ ] ✅ Created custom HTML file
- [ ] ✅ Written Dockerfile
- [ ] ✅ Built custom Docker image
- [ ] ✅ Ran custom container successfully
- [ ] ✅ Accessed web application in browser
- [ ] ✅ Practiced container management commands

**Congratulations! 🎉** You've successfully completed Docker Lab 1 and created your first containerized web application!

---

## 📚 Additional Resources

- [Docker Official Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [Dockerfile Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

---

**Next Lab Preview:** In Lab 2, we'll explore:
- Multi-container applications
- Docker Compose
- Volume mounting
- Environment variables
- Networking between containers

---

*Happy Dockerizing! 🐳*
