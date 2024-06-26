#!/bin/sh

case "$1" in
	start)
		echo -n "Enabling CPU performance ..."
#		echo performance > /sys/module/pcie_aspm/parameters/policy
		echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
		echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
		echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
		echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
		echo performance > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
		echo performance > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
		echo "Creating hugepaga fs ..."
		resize2fs /dev/mmcblk1p4
		mkdir -p /mnt/huge32m
		mount -t hugetlbfs none /mnt/huge32m -o pagesize=32MB
		echo "Done"
		;;
	stop)
		echo -n "Nothing to do here"
		echo "Done"
		;;
	restart)
		$0 stop
		$0 start
		;;
	*)
		echo "Usage $0 { start | stop | restart}" >&2
		exit 1
		;;
esac

exit 0