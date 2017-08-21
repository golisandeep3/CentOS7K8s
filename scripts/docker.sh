#!/bin/bash
set -x


curl -fsSL https://get.docker.com/ | sh

#Modify docker cgroupdriver to systemd (for kubernetes)

sudo mkdir -p /etc/systemd/system/docker.service.d && sudo tee /etc/systemd/system/docker.service.d/override.conf <<- EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --exec-opt native.cgroupdriver=systemd
EOF

systemctl enable docker.service

systemctl start docker.service
