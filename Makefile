NAME =			centos
VERSION =		latest
VERSION_ALIASES =	7.2.1511 7.2 7
TITLE =			CentOS 7
DESCRIPTION =		CentOS 7
SOURCE_URL =		https://github.com/scaleway/image-centos
VENDOR_URL =		https://www.centos.org/
DEFAULT_IMAGE_ARCH =	x86_64


IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	latest
IMAGE_NAME =		CentOS 7 (beta)


# This is specific to distribution images
# -- to fetch latest code, run 'make sync-image-tools'
IMAGE_TOOLS_FLAVORS =   systemd,common,docker-based
IMAGE_TOOLS_CHECKOUT =  764a58e59811d5f6217a3f71a4e009d6ec3e5138


## Image tools  (https://github.com/scaleway/image-tools)
all:    docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
