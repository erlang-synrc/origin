
VERSION ?= $(shell git log --pretty=format:'%h' -n 1)

ARCH	?= amd64
RELEASE	?= saucy

REGISTRY = # img.voxoz.in/

VARIANT	= minbase

TEMPLATE = s/$$RELEASE/$(RELEASE)/g;s/$$ARCH/$(ARCH)/g;s/$$VERSION/$(VERSION)/g

$(RELEASE)-$(ARCH):
	mkdir -p $@-root
	debootstrap --variant=$(VARIANT) --arch=$(ARCH) $(RELEASE) $@-root
	tar -C $@-root -c . | docker import - $@-minbase
	#
	install -d $@-base
	sed 's/$$BASE/$@-minbase/g;$(TEMPLATE)' base/Dockerfile > $@-base/Dockerfile
	install base/sshd.conf $@-base/
	docker build -rm -t $(REGISTRY)$@-base $@-base
	#
	install -d $@-dev
	sed 's/$$BASE/$@-base/g;$(TEMPLATE)' dev/Dockerfile > $@-dev/Dockerfile
	docker build -rm -t $(REGISTRY)$@-dev $@-dev

rmi:
	docker rmi $(RELEASE)-$(ARCH)-minbase $(REGISTRY)/$(RELEASE)-$(ARCH)-base $(REGISTRY)/$(RELEASE)-$(ARCH)-dev
	rm -rf $(RELEASE)-$(ARCH)-root

push:
	docker push $(REGISTRY)/$(RELEASE)-$(ARCH)-base
	docker push $(REGISTRY)/$(RELEASE)-$(ARCH)-dev

.PHONY: $(RELEASE)-$(ARCH) rmi push
