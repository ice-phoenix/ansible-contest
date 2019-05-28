BOX_IMAGE = "ubuntu/bionic64"
WORKER_COUNT = 1

Vagrant.configure("2") do |config|

  config.ssh.forward_agent = true
  config.vm.synced_folder "/var/persistent/", "/var/persistent/", type: "nfs", nfs_udp: false, :linux__nfs_options => ["no_root_squash", "no_subtree_check", "rw"]
 
  config.vm.define "contest-master" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "contest-master"
    subconfig.vm.network "private_network", ip: "192.168.33.10"

    subconfig.vm.provision :ansible do |ansible|
      ansible.playbook = "master.yml"
      ansible.verbose = "v"
    end
  end

  (1..WORKER_COUNT).each do |i|
    config.vm.define "contest-worker#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "contest-worker#{i}"
      subconfig.vm.network :private_network, ip: "192.168.33.#{i + 10}"

      subconfig.vm.provision :ansible do |ansible|
        ansible.playbook = "worker.yml"
        ansible.verbose = "v"
      end
    end
  end

end
