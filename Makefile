
ARCH=i386
RELEASE=raring
TAG=dev

$(RELEASE)-$(ARCH):
	mkdir -p $@-root
	debootstrap --arch=$(ARCH) $(RELEASE) $@-root
	tar -C $@-root -c . | docker import - $@
	docker build -t $@-$(TAG) $@

.PHONY: $(RELEASE)-$(ARCH)
