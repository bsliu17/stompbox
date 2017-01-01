# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # Configure Virtualbox to use host's DNS provider and not 10.0.2.3
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Select box, hostname, and internal IP
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "stompbox"
  config.vm.network :private_network, ip: "192.168.6.66"

  # Kubernetes UI port
  config.vm.network "forwarded_port", guest: 8001, host: 8001

  # Sync'd folder; make sure /home/username/GitHub and /home/username/stompbox exist
  # and that this is run from the latter
  config.vm.synced_folder "../GitHub", "/home/ubuntu/GitHub"
  config.vm.synced_folder ".", "/vagrant" # required for provisioning

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
      codebases: "/home/ubuntu/GitHub",
      stompbox: "/vagrant",
      stompbox_home: "/vagrant/home",
      stompbox_ssh: "/vagrant/ssh",
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
