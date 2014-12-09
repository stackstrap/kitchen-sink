# -*- mode: ruby -*-
# vim: set ft=ruby ts=2 sw=2 et sts=2 :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "stackstrap/ubuntu-trusty"

  config.ssh.forward_agent = true

  config.vm.synced_folder ".", "/home/vagrant/domains/kitchensink.dev",
    owner: "vagrant",
    group: "vagrant",
    mount_options: ["dmode=755,fmode=644"]

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end

end
