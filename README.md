# Rhel image on Scaleway

**Warning: this image is still in development**

**Warning: this image is not useable without a current Red Hat subscription

Scripts to build a RHEL 7  image on Scaleway

This image is built using [Image Tools](https://github.com/scaleway/image-tools) and depends on the official Red Hat docker image. 

---

**This image is meant to be used on a C2 server.**

We use the Docker's building system and convert it at the end to a disk image that will boot on real servers without Docker. Note that the image is still runnable as a Docker container for debug or for inheritance.

[More info](https://github.com/scaleway/image-tools#docker-based-builder)

---

## Install

First start an instance on scaleway, using the "imageb-builder" image. In this image you can use docker to construct images, which then get started and uploaded to your image store.

Once this imagebuilder instance runs, log in, and set it up per the instructions in the motd. Then checkout this repo, cd in to it and run:


    $ make image_on_local 

After the script has finished you should have a Red Hat image in your images list. 

