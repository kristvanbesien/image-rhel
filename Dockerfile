## -*- docker-image-name: "rhel7:latest" -*-
FROM rhel7:registered

# Environment
ENV SCW_BASE_IMAGE rhel7
ENV ARCH x86_64


# Adding and calling builder-enter
COPY ./overlay-image-tools/usr/local/sbin/scw-builder-enter /usr/local/sbin/
RUN  /bin/sh -e /usr/local/sbin/scw-builder-enter 

# Install stuff...
RUN yum install ${YUM_OPTS} -y \
      bash \
      bash-completion \
      ca-certificates \
      cron \
      curl \
      ethstatus \
      haveged \
      ioping \
      iotop \
      iperf \
      locate \
      make \
      mg \
      ntp \
      ntpdate \
      rsync \
      screen \
      socat \
      ssh \
      sudo \
      sysstat \
      tar \
      tcpdump \
      tmux \
      vim \
      wget \
 && yum clean all

# Patch rootfs
COPY ./overlay-image-tools ./overlay ./overlay-${ARCH} /

# Enable Scaleway services
RUN systemctl enable \
	scw-generate-ssh-keys \
	scw-fetch-ssh-keys \
	scw-gen-machine-id \
	scw-kernel-check \
	scw-sync-kernel-modules


# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
