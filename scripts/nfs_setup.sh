sudo apt-get update && sudo apt-get install -y nfs-kernel-server
mkdir /home/vagrant/public
echo '/home/vagrant/public  *(rw,sync,no_root_squash)' | sudo tee -a /etc/exports
sudo /etc/init.d/nfs-kernel-server start
