# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # Virtualbox
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "stompbox"
  config.vm.network :private_network, ip: "192.168.6.66"

  # Sync'd folder; make sure /home/username/code or C:\...\Documents\GitHub exists
  config.vm.synced_folder "..", "/stompbox/GitHub"

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :stompbox do |stompbox|
  end

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "configuration.yml"
    ansible.limit = "stompbox"
    ansible.verbose = "v"
    ansible.sudo = true
    ansible.extra_vars = {
      codebases: "/stompbox/GitHub",
      stompbox: "/stompbox/GitHub/stompbox",
      stompbox_home: "/stompbox/GitHub/stompbox/home",
      stompbox_ssh: "/stompbox/GitHub/stompbox/ssh",
      docker_repo: "deb https://apt.dockerproject.org/repo ubuntu-xenial main",
      apt_installs: [
        "awscli",
        "clang",
        "cppcheck",
        "docker-engine",
        "gcc",
        "git",
        "hping3",
        "ipython",
        "jq",
        "make",
        "nmap",
        "python-pip",
        "tmux",
        "unzip",
        "vim",
        "virtualenv"
      ]
    }
  end
end
