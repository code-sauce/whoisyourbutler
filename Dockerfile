FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Scalyr Inc <support@scalyr.com>
RUN apt-get update && \
  apt-get install -y git python && \
  apt-get clean
RUN cd /usr/bin && mkdir -p /tmp/scalyr/src && cd /tmp/scalyr && \
  git init && \
  git config --local user.name "Scalyr" && git config --local user.email support@scalyr.com && \
  git clone -b release git://github.com/scalyr/scalyr-agent-2.git ./src && \
  cd ./src && \ 
  python build_package.py --no-versioned-file-name docker_tarball && \
  tar --no-same-owner -C / -zxf /tmp/scalyr/src/scalyr-docker-agent.tar.gz && \
  cd / && \
  rm -rf /tmp/scalyr
CMD ["/usr/sbin/scalyr-agent-2", "--no-fork", "--no-change-user", "start"]
