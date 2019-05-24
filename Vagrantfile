
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.forward_agent = true

  config.vm.provision :ansible do |ansible|

    ansible.playbook = "playbook.yml"
  end

end
