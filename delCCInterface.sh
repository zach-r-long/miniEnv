#!/bin/bash
ifconfig hb1 down
ovs-vsctl del-port hb1 
sysctl -w net.ipv4.ip_forward=0
ip link delete hb1
