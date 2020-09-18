#!/bin/bash
ovs-vsctl add-port mega_bridge hb1 -- set interface hb1 type=internal
sysctl -w net.ipv4.ip_forward=1
ifconfig hb1 172.16.10.254 netmask 255.255.0.0
ifconfig hb1 up
