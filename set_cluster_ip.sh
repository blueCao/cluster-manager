#!/bin/bash
# 
# 批量配置集群局域网静态IP
#
# 前提：
#	脚本的执行主机必须能ssh免密码登录所有的集群
#	set_static_ip.sh 在当前目录下
#
# 配置：
#	outer_ips:已有的网络
#	inner_ips:需要配置的局域网网络
#
# 输入：
#	参数1：set_static_ip.sh 脚本文件名

# 外网IP
outer_ips=(
159.226.50.41
159.226.50.42
159.226.50.43
159.226.50.44
159.226.50.47
159.226.50.48
159.226.50.49
159.226.50.50
159.226.50.51
159.226.50.52
159.226.50.54
159.226.50.55
159.226.50.57
)
# 需要配置的内网ip
inner_ips=(
192.168.0.1
192.168.0.2
192.168.0.3
192.168.0.4
192.168.0.7
192.168.0.8
192.168.0.9
192.168.0.10
192.168.0.11
192.168.0.12
192.168.0.14
192.168.0.15
192.168.0.16
)

# 依次执行IP设定
for no in {0..12}
do
	# 1.将执行文件复制到目标服务器
	scp $1 root@${outer_ips[$no]}:~
	# 2.备份IP配置文件 到 /root 目录下
	# 3.执行脚本
	# 4.删除执行脚本
	ssh root@${outer_ips[$no]} "cp -r /etc/sysconfig/network-scripts ~; sh $1 ${inner_ips[$no]} 24 192.168.0.255 /etc/sysconfig/network-scripts/ifcfg-em2; rm $1"
	# 5.显示是否成功
	if [ $? -eq 0 ]; then
		echo "##### SUCESS! #####"${outer_ips[$no]}"	"${inner_ips[$no]}
	else

		echo "##### FAILURE! #####"${outer_ips[$no]}"	"${inner_ips[$no]}
	fi 
done
