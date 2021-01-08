#!/bin/sh
# run as root
#fstrim -v / 2>/dev/null
ntpdate time.nist.gov 2>/dev/null 1>/dev/null
service dnsmasq stop 2>/dev/null

rm -f miniLog
rm -rf /tmp/minimega/
mkdir -p /data/mmfiles

#modprobe kvm_intel
#modprobe kvm
#modprobe openvswitch
#modprobe 8021q
#modprobe nbd max_part=8

tmux kill-session -t mini 2>/dev/null
tmux new -s mini -d
tmux neww -t mini -n mega
tmux neww -t mini -n web
tmux send-keys -t mini:mega "cd minimega" C-m
tmux send-keys -t mini:web "cd minimega" C-m
tmux send-keys -t mini:mega "bin/minimega -degree 4 -filepath="/phenix/images" -context ${1} -logfile="miniLog" -v=true" C-m
tmux send-keys -t mini:mega "cc listen 9002 " C-m
tmux send-keys -t mini:web "sleep 5 && bin/miniweb -console bin/minimega" C-m
echo "done"
