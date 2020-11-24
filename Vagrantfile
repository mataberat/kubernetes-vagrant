VAGRANTFILE_API_VERSION = "2"

N = 2

Vagrant.configure(2) do |config|
  config.vm.define "kube-master-node" do |master|
    master.vm.box = "bento/ubuntu-20.04"
    master.vm.network "private_network", ip: "192.168.40.100"
    master.vm.hostname = "kube-master-node"
    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook/master.yaml"
      ansible.extra_vars = {
        node_ip: "192.168.40.100",
      }
    end
    master.vm.provider "virtualbox" do |virtualbox|
      virtualbox.customize ["modifyvm", :id, "--memory", "2048"]
      virtualbox.customize ["modifyvm", :id, "--acpi", "on"]
      virtualbox.customize ["modifyvm", :id, "--ioapic", "on"]
      virtualbox.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
  (1..N).each do |i|
    config.vm.define "kube-worker-node-#{i}" do |worker|
      worker.vm.box = "bento/ubuntu-20.04"
      worker.vm.network "private_network", ip: "192.168.40.#{i + 100}"
      worker.vm.hostname = "kube-worker-node-#{i}"
      worker.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbook/worker.yaml"
        ansible.extra_vars = {
          node_ip: "192.168.40.#{i + 100}",
        }
      end
      worker.vm.provider "virtualbox" do |virtualbox|
        virtualbox.customize ["modifyvm", :id, "--memory", "2048"]
        virtualbox.customize ["modifyvm", :id, "--acpi", "on"]
        virtualbox.customize ["modifyvm", :id, "--ioapic", "on"]
        virtualbox.customize ["modifyvm", :id, "--cpus", "1"]
      end
    end
  end
end


