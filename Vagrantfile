Vagrant.configure("2") do |config|

  config.vm.define "openstorage" do |openstorage|
    openstorage.vm.box = "ubuntu/trusty64"
    openstorage.vm.box_version = "20160127.0.0"
    openstorage.vm.hostname = "openstorage"
    openstorage.vm.network "private_network", ip: "192.168.99.198"

    openstorage.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    openstorage.vm.provision :shell, path: "scripts/openstorage_setup.sh", privileged: false
    openstorage.vm.provision :shell, inline: "cd ~/gopath/src/github.com/libopenstorage/openstorage && make install", privileged: false
    openstorage.vm.provision "file", source: "config.yaml", destination: "config.yaml"
  end

  config.vm.define "nfs" do |nfs|
    nfs.vm.box = "ubuntu/trusty64"
    nfs.vm.box_version = "20160127.0.0"
    nfs.vm.hostname = "nfs"
    nfs.vm.network "private_network", ip: "192.168.99.199"

    nfs.vm.provision :shell, path: "scripts/nfs_setup.sh", privileged: false
  end
end
