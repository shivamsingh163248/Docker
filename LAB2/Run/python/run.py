#!/usr/bin/env python3
import os
import subprocess

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
print('Running all LAB2 containers from', ROOT)

os.chdir(ROOT)

def run(cmd):
    print('>', ' '.join(cmd))
    subprocess.run(cmd)

run(['docker','run','-d','-p','8081:80','--name','nginx-alpine','my-app-alpine'])
run(['docker','run','-d','-p','8082:80','--name','nginx-ubuntu','my-app-ubuntu'])
run(['docker','run','-d','-p','8083:80','--name','nginx-debian','my-app-debian'])
run(['docker','run','-d','-p','8084:80','--name','nginx-centos','my-app-centos'])
run(['docker','run','-d','-p','8085:80','--name','nginx-amazonlinux','my-app-amazonlinux'])

subprocess.run(['docker','ps'])
