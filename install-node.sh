scp -i /home/vagrant/.ssh/master.key \
    -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    vagrant@$MASTER_IP:/home/vagrant/node-token \
    /home/vagrant/
TOKEN=$(cat /home/vagrant/node-token)

MASTER_IP=$MASTER_IP
NODE_IP=$NODE_IP
K3S_VERSION=$K3S_VERSION

echo "token=${TOKEN}, masterIp=${MASTER_IP} nodeIp=${NODE_IP}"
curl -sfL https://get.k3s.io | \
    INSTALL_K3S_EXEC="--node-external-ip $NODE_IP --flannel-iface=enp0s8" \
    INSTALL_K3S_VERSION="${K3S_VERSION}" \
    K3S_URL="https://${MASTER_IP}:6443" \
    K3S_TOKEN="$TOKEN" \
    sh -