#!bin/bash
# 设置静态IP
#
# 输入：
#	参数1：IP地址
#	参数2：子网掩码的长度
#	参数3：网关地址
#	参数4：文件路径

f=$4
# 设置开机自启、关闭IPV6、设置静态IP模式
sed -i "/^ONBOOT/d" $f
echo "ONBOOT=yes" >> $f

sed -i "/^IPV6INIT/d" $f
echo "IPV6INIT=no" >> $f

sed -i "/^BOOTPROTO/d" $f
echo "BOOTPROTO=static" >> $f

# 设置IP、子网掩码、网关
sed -i "/^IPADDR/d"  $f
echo "IPADDR=$1" >> $f

sed -i "/^PREFIX/d" $f
echo "PREFIX=$2" >> $f

sed -i "/^GATEWAY/d" $f
echo "GATEWAY=$3" >> $f

# 重启网络
service network restart
