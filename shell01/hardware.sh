#!/bin/bash

echo "=========================================="
echo "=                                        ="
echo "=        xx Operation system             ="
echo "=           Select feature               ="
echo "=========================================="
echo "     "
echo "     "
echo "(1)CPU		(4)Packages		(7)HELP"
echo "(2)MEM		(5)Network		(8)about"
echo "(3)Disk		(6)Firewall		(9)exit"
echo "     "
while true;do
	echo -e "Choice:[1-9]     \c"
	read i
	case $i in
		1)
		echo "`lscpu | grep 'Model name'`"
		echo "`lscpu | grep 'CPU(s)' | awk NR==1`"
		echo "`lscpu | grep 'cache'`"
		echo "`lscpu | grep 'CPU MHz'`"
		echo "`lscpu | grep 'CPU max MHz'`"
		echo "`lscpu | grep 'CPU min MHz'`"
		echo "     "
		echo "CPU占用率前10的进程："
		echo "`ps -aux | sort -rn -k3 | head -10 | awk 'BEGIN {print "%CPU    COMMAND"}{print $3"\t",$11"\t"}'`" ;;
		2)
		echo "大小：`dmidecode -t memory | grep -A16 "Memory Device$" | grep "Size:" | head -1`"
		echo "类型：`dmidecode -t memory | grep -A16 "Memory Device$" | grep "Type:" | head -1`"
		echo "`free -h | tail -2 | awk 'BEGIN {print "name    total    used    free"} {print $1"\t",$2"\t",$3"\t",$4"\t"}'`"
		echo "     "
		echo "最耗内存的进程：" 
		echo "`ps -aux | sort -rn -k4 | head -1 | awk 'BEGIN {print "%MEM    COMMAND"} {print $4"\t",$11"\t"}'`";;
		3)
		echo "文件系统的使用率和挂载点"
		echo "`df -hT | awk '{print $1"\t",$6"\t",$7"\t"}'`"
		echo "     "
		echo "i节点的使用率"
		echo "`df -ihT | awk '{print $1"\t",$6"\t"}'`";;
		4)
		echo "包的数量：`rpm -qa | wc -l`"
		echo "     "
		echo "yum源的检测"
		echo "`yum repolist all`" ;;
		5)
		echo "`ifconfig | awk NR==2`"
		echo "`ifconfig | awk NR==4`"
		echo "`hostname`";;
		6)
		echo "`systemctl status firewalld | head -3`"
		echo "`sestatus | head -3`";;
		7)
		echo "welcome help message!"
		echo "热建1:cpu包含型号，核心数，缓存主频，占用CPU最大的进程"
		echo "热建2:内存包含容量，型号，当前使用率，最耗内存的进程"
		echo "热建3:文件系统的使用率，i节点的使用率、文件系统的挂载情况"
		echo "热建4:机器中的安包的数量，并检测源是否可用"
		echo "热建5:可以查看IP、掩码、网关、MAC地址、主机名"
		echo "热建6:可以查看防火墙状态信息，selinux状态"
		echo "热建8:可以查看版本信息"
		echo "热建9:退出程序" ;;
		8)
		echo "version 1.0" ;;
		9)
		break ;;
		*)
		echo "error,please again" ;;
	esac



done
