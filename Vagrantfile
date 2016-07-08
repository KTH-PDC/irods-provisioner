# irods-icat-provisioner
#
# Vagrantfile - manifest file for Vagrant to provision virtual machines
# Author: Ilari Korhonen, KTH Royal Institute of Technology

# JSON array for the Vagrants to be configured
boxes = [
  {
    :name => "rodsmaster1",
    :eth1 => "192.168.56.20",
    :eth2 => "10.13.37.20",
    :mem => "1024",
    :cpu => "1"
  },
  {
    :name => "rodsmaster2",
    :eth1 => "192.168.56.21",
    :eth2 => "10.13.37.21",
    :mem => "1024",
    :cpu => "1"
  }
]

Vagrant.configure(2) do |config|

  # base box for the system image
  config.vm.box = "centos/7"

  # disable shared folders
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true

  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]

      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end

      config.vm.network :private_network, ip: opts[:eth1]
      
      config.vm.network :private_network, ip: opts[:eth2], virtualbox__intnet: true
    end
  end
end
