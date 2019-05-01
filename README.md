# docker-compose-image

A linux container image with docker-compose already installed.

It's based on the official 'docker' image from docker hub: https://hub.docker.com/_/docker

## Why?

I made this for use with a docker-based CI pipeline. Specifically, I usually use [GitLab CI](https://docs.gitlab.com/ce/ci/).

Usually GitLab CI Auto Devops will use the plain `docker` image, but I wanted to define my images using docker-compose. At first, I added docker-compose installation manually on top of the `docker` image, but I soon realized this adds quite some time to each build because you have to install some more alpine dependencies, then upgrade pip, then `pip install docker-compose`. It added several minutes to my build, just to get started.

## Usage with GitLab CI

In your `.gitlab-ci.yml` file, you want something like the following.

```
build_docker_compose:
  stage: build
  # image: docker:18
  image: registry.gitlab.com/gobengo/docker-compose/master:3f57d90496887ff5ca1e1fdcaa0bc265b46dccdd
  services:
  - docker:18-dind
  variables:
    DOCKER_DRIVER: overlay2
  script:
    - setup_docker # If defined by Auto Devops
    - docker-compose build
    - docker-compose push
  only:
    - branches
```
