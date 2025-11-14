#!/usr/bin/env python3
import os
import subprocess

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
print('Cleaning LAB2 containers and images from', ROOT)

os.chdir(ROOT)

containers = ['nginx-alpine','nginx-ubuntu','nginx-debian','nginx-centos','nginx-amazonlinux']
images = ['my-app-alpine','my-app-ubuntu','my-app-debian','my-app-centos','my-app-amazonlinux']

for c in containers:
    print('Stopping', c)
    subprocess.run(['docker','stop',c])

for c in containers:
    print('Removing', c)
    subprocess.run(['docker','rm',c])

for i in images:
    print('Removing image', i)
    subprocess.run(['docker','rmi',i])

print('Cleanup finished')
