# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "trusty32-phpdev-20141220"
  config.vm.box_url = "http://dwnl.nulldevelopment.hr/boxes/trusty32-phpdev-20141220.box"
   
  config.vm.network "private_network", ip: "10.0.6.80"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  
  config.vm.provider "virtualbox" do |v|
    v.name ="gitllo-dev"
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end
    
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "etc/provisioning/vagrant/setup.yml"
    ansible.inventory_path = "etc/provisioning/vagrant/hosts"
    ansible.verbose = true
    ansible.limit = 'all'
  end
end
