
ARCH	?= i386
RELEASE	?= raring

VARIANT	= minbase
#EXCLUDE = upstart,e2fslibs,e2fsprogs,initramfs-tools,initramfs-tools-bin,initscripts,insserv,kmod,libselinux1,libsemanage-common,libsemanage1,libsepol1,module-init-tools,plymouth

$(RELEASE)-$(ARCH):
	mkdir -p $@-root
#	debootstrap --variant=$(VARIANT) --exclude=$(EXCLUDE) --arch=$(ARCH) $(RELEASE) $@-root
	debootstrap --variant=$(VARIANT) --arch=$(ARCH) $(RELEASE) $@-root
	tar -C $@-root -c . | docker import - $@-minbase
	docker build -t $@-base $@-base
	docker build -t $@-dev $@-dev

rmi:
	docker rmi $(RELEASE)-$(ARCH)-minbase $(RELEASE)-$(ARCH)-base $(RELEASE)-$(ARCH)-dev
	rm -rf $(RELEASE)-$(ARCH)-root

.PHONY: $(RELEASE)-$(ARCH)
