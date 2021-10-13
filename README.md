# k3s-vagrant
One step deploy a local cluster (1 master + 2 worker)  via virtualbox/vagrant

# Usage

Make sure that you have properly installed the following:

* VirtualBox
* Vagrant


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
