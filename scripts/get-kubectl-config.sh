#!/bin/bash

echo "Downloading kubectl config"
vagrant scp kube-master-node:/home/vagrant/.kube/config ~/.kube/config-kubernetes-vagrant
echo "kubectl config has been downloaded to ~/.kube/config-kubernetes-vagrant"
