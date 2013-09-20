## Voxoz Packaging

Debs for Ubuntu Raring (13.04) amd64 and i386:

```sh
$ echo deb http://build.voxoz.in/debian raring main >> /etc/apt/sources.list
$ wget -q -O - http://build.voxoz.in/key | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install -y voxoz-erlang
```

### LXC

Building Docker images:

```
make -C buildroot otp
make raring-i386
```

### Building Erlang Debs:

```sh
amd64 $ ./configure --disable-megaco-flex-scanner-lineno --disable-megaco-reentrant-flex-scanner --without-javac --disable-hipe --enable-m64-build && make
i386  $ ./configure --disable-megaco-flex-scanner-lineno --disable-megaco-reentrant-flex-scanner --without-javac --disable-hipe --enable-m32-build && make
$ install -d dest
$ make install DEST=$PWD/dest
$ rm -rf dest/usr/local/lib/erlang/lib/{orber*,cos*,megaco*,hipe*}
$ fakeroot fpm -s dir -t deb -C dest --name voxoz-erlang --version 16.b.2 --iteration 3 .
```
