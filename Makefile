.PHONY: build run

build:
	docker build -t ijs .

run:
	docker run \
		-v $$(pwd)/notebooks:/home/jovyan/notebooks \
		--rm \
		-p 8888:8888 \
		ijs \
		ijs --ijs-show-undefined --notebook-dir=notebooks
