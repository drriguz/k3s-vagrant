scp -i /home/vagrant/.ssh/master.key \
    -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    vagrant@master:/home/vagrant/node-token \
    /home/vagrant/
TOKEN=$(cat /home/vagrant/node-token)
IP=192.168.100.100

echo "token=${TOKEN}, ip=${IP}"
curl -sfL https://get.k3s.io | K3S_URL="https://$IP:6443" K3S_TOKEN="$TOKEN" sh -