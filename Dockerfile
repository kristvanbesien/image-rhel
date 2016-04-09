## -*- docker-image-name: "rhel7:latest" -*-
FROM rhel7/rhel

# Environment
ENV SCW_BASE_IMAGE rhel7
ENV ARCH x86_64


# Adding and calling builder-enter
COPY ./overlay-${ARCH}/etc/yum.repos.d/ /etc/yum.repos.d/
COPY ./overlay-image-tools/usr/local/sbin/scw-builder-enter /usr/local/sbin/
RUN  /bin/sh -e /usr/local/sbin/scw-builder-enter 

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
