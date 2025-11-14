#!/usr/bin/env python3
import os
import subprocess

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
print('Running all LAB2 containers from', ROOT)

os.chdir(ROOT)

def run_or_start(container_name, image_name, port):
    print(f'Starting {container_name} on port {port}...')
    # Try to start existing container first
    result = subprocess.run(['docker', 'start', container_name], 
                          capture_output=True, text=True)
    if result.returncode != 0:
        # Container doesn't exist, create it
        subprocess.run(['docker','run','-d','-p',f'{port}:80','--name',container_name,image_name])
    else:
        print(f'{container_name} started')

containers = [
    ('nginx-alpine', 'my-app-alpine', '8081'),
    ('nginx-ubuntu', 'my-app-ubuntu', '8082'),
    ('nginx-debian', 'my-app-debian', '8083'),
    ('nginx-centos', 'my-app-centos', '8084'),
    ('nginx-amazonlinux', 'my-app-amazonlinux', '8085')
]

for container_name, image_name, port in containers:
    run_or_start(container_name, image_name, port)

subprocess.run(['docker','ps'])
