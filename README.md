# Packer Centos7 with Kubernetes

Note: You need to install kvm before building the qcow2 image using packer.Also check if your machine supports virtualization.

This repo has scripts which installs kubernetes and all prerequisites for it.


## Image Builder

Steps to run

1. Download and Install packer tool 
https://www.packer.io/downloads.html

2. export PACKER_LOG=1 && export PACKER_LOG_PATH="packer.log" && ./packer build centos7.json

3.  qemu-img convert -O qcow2 -c centos7-xfs centos7-xfs.qcow2

## Setup K8s Master

1. Login into vm   
   ssh  root@<ip>
   password   root
   
2. kubeadm init

3. cp /etc/kubernetes/admin.conf $HOME/

   sudo chown $(id -u):$(id -g) $HOME/admin.conf

   export KUBECONFIG=$HOME/admin.conf

4. export kubever=$(kubectl version | base64 | tr -d '\n')

   kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
   
## Joining K8s Nodes
   
   kubeadm join --token \<token\> \<master-ip\>:\<master-port\>





                   
      
