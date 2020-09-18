#!/bin/sh
# run as root
#fstrim -v / 2>/dev/null
tmux kill-session -t mini 2>/dev/null
pkill -9 minimega
pkill -9 qemu
pkill -9 miniweb

echo "done"
