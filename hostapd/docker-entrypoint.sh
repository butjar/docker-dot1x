#!/bin/sh
set -e

ifup -avf

iface=br0
sys_operstate=/sys/class/net/"${iface}"/operstate

# Wait for bridge to come UP
ifstate=$(cat "${sys_operstate}" 2>/dev/null || echo "Interface not found")
while [ "${ifstate}" != "up" ]; do
	echo "Waiting for ${iface} to come UP. Operstate: ${ifstate}"
	ifup -avf
	sleep 1
	ifstate=$(cat "${sys_operstate}" 2>/dev/null || echo "Interface not found")
done

# Apply sysctl conf if exists
[ -f /etc/sysctl.d/dot1x.conf ] && sysctl -p /etc/sysctl.d/dot1x.conf

# Remove old ctrl_iface sockets
rm -rf /var/run/hostapd/*
rm -rf /tmp/wpa_ctrl_*

exec "$@"
