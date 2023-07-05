#!/bin/bash

podman build -t quay.io/jacding/linuxptp-daemon:4.15 -f ./Dockerfile .
