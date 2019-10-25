#!/bin/bash

sudo docker run \
  -v $(pwd)/notebooks:/home/jovyan/notebooks \
  --rm \
  -p 8888:8888 \
  ijs \
  ijs --ijs-show-undefined --notebook-dir=notebooks
