Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 3072
    v.cpus = 2
  end

  config.vm.box = "phusion/ubuntu-14.04-amd64"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.verbose = "vvvv"
  end

  config.vm.network "private_network", ip: "192.168.50.42"

  # Docker
  config.vm.network "forwarded_port", guest: 2375, host: 2375

  # Tomcat api
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Tomcat drivers
  config.vm.network "forwarded_port", guest: 9090, host: 9090

  # Play
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  # fake-sns
  config.vm.network "forwarded_port", guest: 9292, host: 9292

  config.vm.synced_folder "/Users", "/Users", type: "nfs"
  config.vm.synced_folder "#{ENV['HOME']}/.m2", "/home/vagrant/.m2", type: "nfs"
  config.vm.synced_folder "#{ENV['HOME']}/.ivy2", "/home/vagrant/.ivy2", type: "nfs"
end