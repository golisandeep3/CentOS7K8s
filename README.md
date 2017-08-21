# Packer Centos7 with Kubernetes

Note: You need to install kvm before building the qcow2 image using packer.Also check if your machine supports virtualization.

Steps to run

1. Download and Install packer tool 
https://www.packer.io/downloads.html

2. export PACKER_LOG=1 && export PACKER_LOG_PATH="packer.log" && ./packer build centos7.json

3.  qemu-img convert -O qcow2 -c centos7-xfs centos7-xfs.qcow2
