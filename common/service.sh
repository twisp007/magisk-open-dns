#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

#Open DNS
#https://en.wikipedia.org/wiki/OpenDNS#Name_server_IP_addresses
#208.67.222.222
#208.67.220.220
#208.67.222.220
#208.67.220.222

iptables -t nat -D OUTPUT -p tcp --dport 53 -j DNAT --to-destination 208.67.222.220:53 || true
iptables -t nat -D OUTPUT -p udp --dport 53 -j DNAT --to-destination 208.67.222.220:53 || true
iptables -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 208.67.222.220:53
iptables -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 208.67.222.220:53
