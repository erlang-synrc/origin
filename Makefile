
ARCH	?= i386
RELEASE	?= raring

$(RELEASE)-$(ARCH):
	mkdir -p $@-root
	debootstrap --variant=minbase --arch=$(ARCH) $(RELEASE) $@-root
	tar -C $@-root -c . | docker import - $@-minbase
	docker build -t $@-base $@-base
	docker build -t $@-dev $@-dev

.PHONY: $(RELEASE)-$(ARCH)
