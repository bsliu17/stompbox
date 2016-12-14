# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

require 'credentials.rb'
Vagrant.configure("2") do |config|

  # Virtualbox
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "stompbox"
  #config.vm.network :private_network, ip: "192.168.6.66"

  # Sync'd folder; make sure /home/username/GitHub and /home/username/stompbox exist
  # and that this is run from the latter
  config.vm.synced_folder "../GitHub", "/home/ubuntu/GitHub"
  #config.vm.synced_folder "../.ssh", "/home/ubuntu/.ssh"
  config.vm.synced_folder ".", "/vagrant" # required for provisioning

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :stompbox do |stompbox|
  end

  # Configure AWS provider
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = AWS_ACCESS_KEY_ID
    aws.secret_access_key = AWS_SECRET_ACCESS_KEY
    # aws.session_token = "SESSION TOKEN"
    # aws.keypair_name = "KEYPAIR NAME"
    aws.ami = "ami-7747d01e"

    # Make sure you have a private key already set in /home/you/.ssh/id_rsa
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "/home/joshua/.ssh/id_rsa"
  end

  # Set AWS credentials inside guest (so we don't need .boto or .aws/config set)
  config.vm.provision "shell", inline: "export AWS_ACCESS_KEY_ID " + AWS_ACCESS_KEY_ID
  config.vm.provision "shell", inline: "export AWS_SECRET_ACCESS_KEY " + AWS_SECRET_ACCESS_KEY

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
