#!/bin/sh

set -e

# Wait for UNIX CTRL socket from hostapd
ctrl_iface=br0
ctrl_socket=/var/run/hostapd/"${ctrl_iface}"

while [ ! -e "${ctrl_socket}" ]; do
	echo "Waiting for hostapd to create CTRL socket ${ctrl_socket}"
	sleep 1
done

ctrl_ss=$(ss -elx | grep -w "$(stat -c 'ino:%i dev:0/%d' ${ctrl_socket} 2>/dev/null)" || true)
while [ -z "$ctrl_ss" ]; do
	echo "Waiting for hostapd to open CTRL socket ${ctrl_socket}"
	sleep 1
	ctrl_ss=$(ss -elx | grep -w "$(stat -c 'ino:%i dev:0/%d' ${ctrl_socket} 2>/dev/null)" || true)

done

./usr/local/bin/802-1x block_all

exec "$@"
