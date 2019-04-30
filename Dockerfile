ARG docker_image=docker:18

FROM ${docker_image} as docker

RUN apk add --update --no-cache \
  python-dev \
  # python3-dev \
  build-base \
  py-pip \
  gcc \
  # openssl-dev \
  libffi-dev \
  openssh-client

RUN pip install --upgrade pip
RUN pip install docker-compose
