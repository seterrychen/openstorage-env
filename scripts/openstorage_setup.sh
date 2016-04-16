sudo apt-get update && sudo apt-get install -y git

# install Docker
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' | sudo tee -a /etc/apt/sources.list
sudo apt-get update && sudo apt-get install -y docker-engine

# install golang
wget -q https://storage.googleapis.com/golang/go1.5.3.linux-amd64.tar.gz
sudo tar -xf go1.5.3.linux-amd64.tar.gz -C /usr/local/
echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/vagrant/.profile
echo 'export GOPATH=/home/vagrant/gopath' >> /home/vagrant/.profile

# install openstorage
mkdir -p /home/vagrant/gopath/src/github.com/libopenstorage/
cd /home/vagrant/gopath/src/github.com/libopenstorage/
git clone https://github.com/libopenstorage/openstorage.git
