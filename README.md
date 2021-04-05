gentoo-overlay
==============

Overlay for Gentoo/Linux packages

The following packages are available in this overlay:

* dev-util/sjasmplus - https://github.com/z00m128/sjasmplus

## Warning

This overlay is not official and it is not available in layman's repository.

**Use ebuilds supplied in this repository on your own risk**. They've been tested on my own system setup (~amd64).

## Installing

### Using eselect repository

Make sure you have installed: app-eselect/eselect-repository

`eselect repository add cizo2000 git https://github.com/cizo2000/gentoo-overlay.git`


### Using Layman

First time using layman? See https://wiki.gentoo.org/wiki/Layman

`layman -f -o https://raw.githubusercontent.com/cizo2000/gentoo-overlay/master/overlay.xml -a cizo2000`
