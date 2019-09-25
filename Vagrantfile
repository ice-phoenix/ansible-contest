DOCKER_IMAGE = "rastasheep/ubuntu-sshd:18.04"
WORKER_COUNT = 1

Vagrant.configure("2") do |config|

  config.ssh.username = "root"
  config.ssh.password = "root"
  config.ssh.forward_agent = true

  config.vm.synced_folder "/var/persistent/", "/var/persistent/"

  config.vm.provider "docker" do |subconfig|
    subconfig.image = DOCKER_IMAGE
    subconfig.privileged = true
    subconfig.has_ssh = true
  end
  
  config.vm.define "contest-master" do |subconfig|
    subconfig.vm.hostname = "contest-master"
    subconfig.vm.network "private_network", ip: "192.168.33.10"
    subconfig.vm.network "forwarded_port", guest: 80, host: 1980
    subconfig.vm.network "forwarded_port", guest: 443, host: 19443

    subconfig.vm.provision :ansible do |ansible|
      ansible.playbook = "master.yml"
      ansible.verbose = "v"
    end
  end

  (1..WORKER_COUNT).each do |i|
    config.vm.define "contest-worker#{i}" do |subconfig|
      subconfig.vm.hostname = "contest-worker#{i}"
      subconfig.vm.network :private_network, ip: "192.168.33.#{i + 10}"

      subconfig.vm.provision :ansible do |ansible|
        ansible.playbook = "worker.yml"
        ansible.verbose = "v"
      end
    end
  end

end
