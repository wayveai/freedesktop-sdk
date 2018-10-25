kind: autotools
description: GNU make

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: glibc.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: debugedit-host.bst
  type: build

variables:
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{triplet}'

config:
  configure-commands:
    (<):
    - |
      autoreconf -fvi

  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install}

  - |
    %{delete_libtool_files}

sources:
- kind: tar
  url: ftp_gnu_org:make/make-4.2.1.tar.bz2
  ref: d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589
- kind: patch
  path: patches/make-glob_interface_version_2.patch
- kind: patch
  path: patches/make-lstat.patch
