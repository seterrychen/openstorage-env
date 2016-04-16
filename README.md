# Open Storage environment

```
$ git clone https://github.com/seterrychen/openstorage-env.git
$ cd openstorage-env
$ vagrant up
```

Then it will start two vm: nfs and openstorage. 

```
$ vagrant ssh openstorage
$ sudo ./gopath/bin/osd -d -f config.yaml 2> osd.log &
$ sudo docker volume create -d nfs --name test
$ sudo docker run -v test:/root --volume-driver=nfs -ti busybox
```
