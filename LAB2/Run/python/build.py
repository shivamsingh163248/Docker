#!/usr/bin/env python3
import os
import subprocess

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
print('Building all LAB2 images from', ROOT)

os.chdir(ROOT)

def run(cmd):
    print('>', ' '.join(cmd))
    res = subprocess.run(cmd)
    if res.returncode != 0:
        print('Command failed:', cmd)

run(['docker','build','-f','Dockerfile.alpine','-t','my-app-alpine','.'])
run(['docker','build','-f','Dockerfile.ubuntu','-t','my-app-ubuntu','.'])
run(['docker','build','-f','Dockerfile.debian','-t','my-app-debian','.'])
run(['docker','build','-f','Dockerfile.centos','-t','my-app-centos','.'])
run(['docker','build','-f','Dockerfile.amazonlinux','-t','my-app-amazonlinux','.'])

subprocess.run(['docker','images'])
