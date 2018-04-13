#!/bin/bash
# 本地安装docker脚本

#yum -y install bzip2
#tar -xjvf ~/k8s_images.tar.bz2 
#cd k8s_images
#yum -y localinstall docker-ce-*
#systemctl start docker && systemctl enable docker
#docker version

#cd k8s_images/docker_images/
#for i in $(ls *.tar);do docker load < $i;done
#cd ..
#docker load < kubernetes-dashboard_v1.8.1.tar

cd /root/k8s_images/
rpm -ivh socat-1.7.3.2-2.el7.x86_64.rpm
rpm -ivh kubernetes-cni-0.6.0-0.x86_64.rpm \
 kubelet-1.9.9-9.x86_64.rpm  \
 kubectl-1.9.0-0.x86_64.rpm
rpm -ivh kubectl-1.9.0-0.x86_64.rpm
rpm -ivh kubeadm-1.9.0-0.x86_64.rpm
rpm -qa |grep kube
rpm -qa |grep socat
systemctl enable kubelet && systemctl start kubelet
