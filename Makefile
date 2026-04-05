SHELL := /bin/bash

.PHONY: help update core dev workstation fonts awesome vim-build-deps link bootstrap docker

help:
	@echo "Available targets:"
	@echo "  update          - apt update/full-upgrade/autoremove"
	@echo "  core            - install core packages"
	@echo "  dev             - install development packages"
	@echo "  workstation     - install optional workstation packages"
	@echo "  fonts           - install font packages"
	@echo "  awesome         - install AwesomeWM package group"
	@echo "  vim-build-deps  - install Vim build dependencies"
	@echo "  link            - symlink config files into HOME"
	@echo "  bootstrap       - run the interactive bootstrap flow"
	@echo "  docker          - install Docker from Docker's apt repo"

update:
	./scripts/system-update.sh

core:
	./scripts/install-core-packages.sh

dev:
	./scripts/install-dev-packages.sh

workstation:
	./scripts/install-workstation-packages.sh

fonts:
	./scripts/install-font-packages.sh

awesome:
	./scripts/install-awesome-packages.sh

vim-build-deps:
	./scripts/install-vim-build-deps.sh

link:
	./scripts/link-configs.sh

bootstrap:
	./scripts/bootstrap.sh

docker:
	./scripts/install-docker.sh
