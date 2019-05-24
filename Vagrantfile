
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.forward_agent = true

  config.vm.synced_folder "/var/persistent/", "/var/persistent/", type: "nfs", nfs_udp: false, :linux__nfs_options => ["no_root_squash", "no_subtree_check", "rw"]

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = true
  end

end
