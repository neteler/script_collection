#!/bin/bash

# Purpose: participate in WebEx sessions
#          - screensharing works
#          - audio does probably not work (use land line = phone to call in)
#
# Author:  Markus Neteler, 2018
#          tested successfully on Fedora 27

## Source:
## https://github.com/morpheus-med/ff32-webex

# WebEx is a trademark of Cisco
# see https://www.cisco.com/c/en/us/about/legal/trademarks.html

######
# https://hub.docker.com/r/mbessler/ff32-webex/
DOCKERIMG=${DOCKERIMG:-mbessler/ff32-webex}

default_url=https://www.webex.com/go/attend-meeting
url=${1-$default_url}

sudo xhost +local:webex-$(id -un)
sudo docker run --rm --hostname=webex-$(id -un) -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged -v /dev/snd:/dev/snd -v $HOME/ff32webex:/webex ${DOCKERIMG} $url

