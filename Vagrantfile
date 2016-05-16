Vagrant.configure("2") do |config|

  config.vm.define "openstorage" do |openstorage|
    openstorage.vm.box = "ubuntu/trusty64"
    openstorage.vm.box_version = "20160127.0.0"
    openstorage.vm.hostname = "openstorage"
    openstorage.vm.network "private_network", ip: "192.168.99.197"

    openstorage.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    openstorage.vm.provision :shell, path: "scripts/openstorage_setup.sh", privileged: false
    openstorage.vm.provision :shell, inline: "go get github.com/portworx/kvdb/common", privileged: false
    openstorage.vm.provision :shell, inline: "cd ~/gopath/src/github.com/libopenstorage/openstorage && make install", privileged: false
    openstorage.vm.provision "file", source: "config.yaml", destination: "config.yaml"
  end

  config.vm.define "openstorage2" do |openstorage2|
    openstorage2.vm.box = "ubuntu/trusty64"
    openstorage2.vm.box_version = "20160127.0.0"
    openstorage2.vm.hostname = "openstorage"
    openstorage2.vm.network "private_network", ip: "192.168.99.198"

    openstorage2.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    openstorage2.vm.provision :shell, path: "scripts/openstorage_setup.sh", privileged: false
    openstorage2.vm.provision :shell, inline: "go get github.com/portworx/kvdb/common", privileged: false
    openstorage2.vm.provision :shell, inline: "cd ~/gopath/src/github.com/libopenstorage/openstorage && make install", privileged: false
    openstorage2.vm.provision "file", source: "config.yaml", destination: "config.yaml"
  end

  config.vm.define "nfs" do |nfs|
    nfs.vm.box = "ubuntu/trusty64"
    nfs.vm.box_version = "20160127.0.0"
    nfs.vm.hostname = "nfs"
    nfs.vm.network "private_network", ip: "192.168.99.199"

    nfs.vm.provision :shell, path: "scripts/nfs_setup.sh", privileged: false
    nfs.vm.provision :shell, inline: "apt-get install unzip", privileged: true
    nfs.vm.provision :shell, inline: "wget -q https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip", privileged: true
    nfs.vm.provision :shell, inline: "unzip consul_0.6.4_linux_amd64.zip", privileged: true
    nfs.vm.provision :shell, inline: "nohup ./consul agent -server -data-dir=/home/vagrant/consul-data -bind=192.168.99.199 -client=192.168.99.199 -bootstrap-expect 1 > /home/vagrant/consul.log &", privileged: false
  end
end
