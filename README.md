### Requirements
- Vagrant 2.2.14
- VirtualBox 6.1

Make sure you don't have any Vagrant box installed in private range `192.168.40.0/24`. This private range will be used by the Master and Node.

### Basic cluster configuration

#### Cluster Configuration
- Calico installed
- MetalLB IP Range: 192.168.40.106-192.168.40.150
- Ingress Nginx installed with LoadBalancer service (will assigned the External IP from MetalLB)

#### Master Node
- Host IP: 192.168.40.100
- VM Name and Hostname: kube-master-node
- OS: Ubuntu 20.04 (bento/ubuntu-20.04)
- 2vCPU and 2Gb of RAM

#### Worker Node
- Host IP: 192.168.40.101-192.168.40.x
- VM Name and Hostname: kube-worker-node-1 - kube-worker-node-2
- OS: Ubuntu 20.04 (bento/ubuntu-20.04)
- 1vCPU and 2Gb of RAM
- To set the total of Worker Nodes, change the `N` variable on `Vagrantfile`


### Installation
``
$ git clone https://github.com/mataberat/kubernetes-vagrant.git
$ cd kubernetes-vagrant/ ; vagrant up
``

### Download the kubectl config file
#### Requirement
- vagrant-scp plugin

``
$ ./scripts/get-kubectl-config.sh
``

The kubectl config will be located on `~/.kube/config-kubernetes-vagrant`

