NOTEBOOKS_DIR=$(shell pwd)/notebooks

.PHONY: build
build:
	docker build -t ijs .

.PHONY: podman-build
podman-build:
	podman build -t ijs .
	podman build --file Dockerfile.podman -t ijs:podman .

.PHONY: run
run:
	docker run \
		-v ${NOTEBOOKS_DIR}:/home/jovyan/notebooks \
		--rm \
		-p 8888:8888 \
		ijs \
		ijs --ijs-show-undefined --notebook-dir=notebooks --ip=127.0.0.1

.PHONY: podman-run
podman-run:
	podman run \
		-v ${NOTEBOOKS_DIR}:/home/jovyan/notebooks:Z \
		--rm \
		-p 8888:8888 \
		ijs:podman \
		ijs --ijs-show-undefined --notebook-dir=notebooks --allow-root --ip=127.0.0.1

