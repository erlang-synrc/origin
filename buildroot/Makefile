
BR= buildroot-2013.08
BUILDROOT= http://buildroot.uclibc.org/downloads/$(BR).tar.gz

bootstrap: $(BR).tar.gz
	tar xvzf $(BR).tar.gz

$(BR).tar.gz:
	wget $(BUILDROOT)

otp: otp-r15 otp-r16

otp-r15 otp-r16: bootstrap
	ln -sf ../$@.config $(BR)/.config
	$(MAKE) $@-prep
	$(MAKE) -C $(BR)
	cp $(BR)/output/images/rootfs.tar $@.tar
	$(MAKE) -C $(BR) clean
	tar rvf $@.tar -C extra .

otp-r15-prep:

otp-r16-prep:
	rm -rf $(BR)/package/erlang
	ln -sf ../../package/erlang $(BR)/package/

docker-import:
	docker import - voxoz-otp-r15 < otp-r15.tar
	docker import - voxoz-otp-r16 < otp-r16.tar
