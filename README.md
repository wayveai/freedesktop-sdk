# freedesktop-sdk

The freedesktop-sdk is a project that provides Platform and SDK runtimes for [flatpak](https://flatpak.org) apps and runtimes based on freedesktop modules.

It's being built with [Buildstream](https://gitlab.com/BuildStream/buildstream), with multi-architecture support out of the box.

This project is still in the beta stage, so we have no official stable release yet.

# Usage

Currently the freedesktop-sdk is meant to be used as the base for all Flatpak applications.

So you simply need to point your Flatpak build to our release server http://cache.sdk.freedesktop.org/releases/.

Located here you should find releases built for multiple architectures (aarch64, i586, x86_64).

## Building locally

If you wish to build locally, you must have BuildStream installed and a local instance of [libostree](https://ostree.readthedocs.io/) on your machine.

The instructions for building can be found the in the projects Gitlab-CI file.

We are hoping to provide a more in-depth guide in the future.

# Structure
Current directory structure is:

 - bootstrap
 - sdk
   - plugins

The bootstrap folder includes a set of instructions to bootstrap a minimal sysroot, used to build all the freedesktop flatpak runtimes in the sdk folder.

The sdk folder contains the instructions to build the freedesktop-sdk flatpak runtimes.

The plugins directory, is a custom directory needed to host our custom Buildstream [plugins](https://buildstream.gitlab.io/buildstream/pluginindex.html#plugins)

# Contributing

Finally if you would like to contribute or suggest any improvements to the bootstrap/SDK, please submit an MR.

In the future we are going to configure the CI to allow users to push/test their fixes/improvements automatically across all supported platforms.

If you would like to ask any questions on how to use/improve this project, you will find us over at #freedesktop-sdk on Freenode, and we have a mailing list https://lists.freedesktop.org/mailman/listinfo/freedesktop-sdk.
