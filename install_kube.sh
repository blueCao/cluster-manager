#!/bin/bash
# 
# 配置 kubernet的安装源,并安装 kubelet kubeadm kubectl
#
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
EOF
# 关闭SELinux
setenforce 0
(yum install -y kubelet-1.9.0-0 kubeadm-1.9.0-0 kubectl-1.9.0-0 && systemctl enable kubelet && systemctl start kubelet)&
