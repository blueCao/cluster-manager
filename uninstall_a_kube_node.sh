#!/bin/bash
# 在一个节点卸载kubernete
#
# 依次进行如下操作
#	-卸载kube命令
#	-移动相关软件包
#	-删除kube缓存
#	-重启(结束无用进程)

kubeadm reset
yum remove -y kubeadm kubectl kubelet kubernetes-cni kube*
yum -y autoremove
rm -rf ~/.kube
reboot
