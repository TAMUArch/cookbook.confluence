# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "confluence"
  config.vm.box = "ubuntu-12.04"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.network :forwarded_port, guest: 8090, host: 8090
  config.vm.network :forwarded_port, guest: 8443, host: 8443

  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      "confluence" => {
        "proxy" => {
          "use_proxy" => true,
          "port" => 8443
        }
      },
      "java" => {
        "jdk_version" => 7
      },
      "postgresql" => {
        "password" => {
          "postgres" => "postgres"
        }
      }
    }
    chef.run_list = [
      "recipe[java]",
      "recipe[confluence::database]",
      "recipe[confluence]",
      "recipe[confluence::proxy]"
    ]
  end
end
