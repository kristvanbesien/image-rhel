NAME =			rhel7
VERSION =		latest
VERSION_ALIASES =	7.2
TITLE =			RHEL 7
DESCRIPTION =		Red Hat Enterprise Linux 7
SOURCE_URL =		https://github.com/kristvanbesien/image-rhel
VENDOR_URL =		https://www.redhat.com/
DEFAULT_IMAGE_ARCH =	x86_64


IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	latest
IMAGE_NAME =		RHEL 7 


# This is specific to distribution images
# -- to fetch latest code, run 'make sync-image-tools'
IMAGE_TOOLS_FLAVORS =   systemd,common,docker-based
IMAGE_TOOLS_CHECKOUT =  764a58e59811d5f6217a3f71a4e009d6ec3e5138


## Image tools  (https://github.com/scaleway/image-tools)
all:    docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
