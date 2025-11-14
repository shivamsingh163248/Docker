#!/usr/bin/env python3
import os
import subprocess

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
print('Stopping LAB2 containers from', ROOT)

os.chdir(ROOT)

containers = ['nginx-alpine','nginx-ubuntu','nginx-debian','nginx-centos','nginx-amazonlinux']
for c in containers:
    print('Stopping', c)
    subprocess.run(['docker','stop',c])

print('Stop complete')
