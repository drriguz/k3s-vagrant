apt install net-tools

# 192.168.100.100 master.local-k3s.com master
# 192.168.100.101 node01.local-k3s.com node01
# 192.168.100.102 node02.local-k3s.com node02
cat <<EOF >> /etc/hosts

192.168.100.100 master
192.168.100.101 node01
192.168.100.102 node02
EOF