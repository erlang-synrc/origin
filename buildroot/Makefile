
BR= buildroot-2013.08
BUILDROOT= http://buildroot.uclibc.org/downloads/$(BR).tar.gz

bootstrap: $(BR).tar.gz
	tar xvzf $(BR).tar.gz

$(BR).tar.gz:
	wget $(BUILDROOT)

otp: otp-r15 otp-r16

otp-r15 otp-r16:
	cd $(BR) && ln -sf ../$@.config .config && make
