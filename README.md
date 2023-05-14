# Bettercap container

Docker for https://github.com/bettercap/bettercap. Rebuilt daily.

## Pulling

### DockerHub

[![Docker build and upload](https://github.com/FinchSec/bettercap-docker/actions/workflows/docker.yml/badge.svg?event=push)](https://github.com/FinchSec/bettercap-docker/actions/workflows/docker.yml)

URL: https://hub.docker.com/r/finchsec/bettercap

`sudo docker pull finchsec/bettercap`

## Running

`sudo docker run --rm -it --privileged --net=host finchsec/bettercap`
