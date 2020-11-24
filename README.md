### Requirements
- Vagrant 2.2.14
- VirtualBox 6.1


### Installation
``
$ git clone https://github.com/mataberat/kubernetes-vagrant.git
$ cd kubernetes-vagrant/ ; vagrant up
``

### Download the kubectl config file
#### Requirement
- vagrant-scp plugin

``
# ./scripts/get-kubectl-config.sh
``

The kubectl config will be located on `~/.kube/config-kubernetes-vagrant`

