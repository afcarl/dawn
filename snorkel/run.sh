#!/bin/bash

docker run -it --name snorkel --rm -p 8888:8888 -v `pwd`:/root dawn_snorkel
