#!/bin/bash

git submodule update --init
pip install -r requirements.txt
export DOCKER_HOST=tcp://0.0.0.0:2375
vagrant up