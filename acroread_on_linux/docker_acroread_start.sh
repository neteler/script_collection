#!/bin/sh

# Markus Neteler, 2015, 2017
#
# Runs the old Acrobat Reader (acroread) in docker environment, on "any" Linux.
# acroread is needed to fill out XFA forms, okular etc are not capable to do that.
# 
# Using this script, acroread starts like a normal application with its GUI.
# Files are mapped for direct exchange between /tmp on host machine and /home/acroread/Documents in the docker instance.
#
# Source: https://registry.hub.docker.com/u/chrisdaish/acroread/
#################################

### NOTE: run as "root"

### https://docs.docker.com/engine/installation/linux/ubuntulinux/
### first time only: install docker
#  dnf install docker | apt-get install docker-io
#
### optional: start at boot time
#  systemctl enable docker
### actually start the service
#sudo systemctl start docker

### check if acroread docker image is already there
# docker ps -a | grep acroread

### if not there, fetch acroread docker image and call it "acroread" for convenience:
### Note: we do display mapping and volume mapping by "source_dir_host:target_dir_docker_instance"
# fetch it:
# sudo docker run -v /tmp:/home/acroread/Documents:rw -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name acroread -i -t chrisdaish/acroread

### bring up the instance:
### allow docker to open windows
sudo xhost +local:docker
sudo docker start acroread

### after usage disallow docker to open windows
echo "sudo xhost -local:docker"

### optionally put docker back to sleep
echo "sudo systemctl stop docker"
# systemctl disble docker

