echo "installing k3s on master: ${K3S_VERSION}/${MASTER_IP}"
chmod +x /home/vagrant/k3s-install.sh
INSTALL_K3S_VERSION="${K3S_VERSION}" \
    INSTALL_K3S_EXEC="--node-external-ip ${MASTER_IP} \
                  --tls-san ${MASTER_IP} \
                  --flannel-iface=enp0s8" \
    /home/vagrant/k3s-install.sh
cp /var/lib/rancher/k3s/server/node-token /home/vagrant/node-token
chown vagrant:vagrant /home/vagrant/node-token