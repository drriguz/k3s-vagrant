# k3s-vagrant
One step deploy a local cluster (1 master + 2 worker)  via virtualbox/vagrant

# Quick Start

Make sure that you have properly installed the following:

* VirtualBox
* Vagrant

## Install K3s Cluster
```bash
git clone https://github.com/drriguz/k3s-vagrant.git
cd k3s-vagrant
vagrant up
```

After that the cluster should be created, and this might take several mintes. To access the cluster, using the following commands:

```bash
vagrant ssh master
sudo kubectl get nodes
```

You shoule be able to see the cluster information like this:
```
vagrant@master:~$ sudo kubectl get nodes
NAME     STATUS   ROLES                  AGE   VERSION
master   Ready    control-plane,master   13m   v1.21.5+k3s2
node01   Ready    <none>                 11m   v1.21.5+k3s2
node02   Ready    <none>                 10m   v1.21.5+k3s2
```

## Access Cluster From Host

To access cluster directly from host use `kubectl` command, do:

```bash
mkdir -p ~/.kube
vagrant ssh -c "sudo cat /etc/rancher/k3s/k3s.yaml" > ~/.kube/config
```

And then modify the ip address to the master ip address, eg:

```
    ...
    server: https://192.168.79.100:6443
    ...
```

# Advanced Usage
## Common Issues

Sometimes the k3s may fail to install due to network issue or other kinds of problems, to fix this, you could possibily try:

* Delete all virtual machines in VirtualBox control panel, and then run `vagrant up` again to start a fresh installation
* (Recommended) First try to run `vagrant up`, if still failed, then you can try to manually provision failed nodes, eg. `vagrant provision master`

## Configuration

All available configurations are listed at the beginning of Vagrantfile:

* NETWORK_BASE="192.168.79.10"
* K3S_VERSION ="v1.19.15+k3s2"

* MASTER_CPUS   = 1
* MASTER_MEMORY = 4096
* NODE_COUNT    = 2
* NODE_CPUS     = 2
* NODE_MEMORY   = 4096

If you would like to customize it, modify the value and then start installation.

## Use local cache

Manually download k3s binaries, and put it into ./cache/version, eg.

```
cache\
    v1.19.15+k3s2\
        sha256sum-amd64.txt
        k3s
```