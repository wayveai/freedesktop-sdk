kind: autotools
description: GNU make

depends:
- filename: make-build-deps.bst
  type: build
- filename: glibc.bst
  type: runtime

(@): target.yml

config:
  configure-commands:
    (<):
    - |
      autoreconf -fvi

sources:
- kind: tar
  url: ftp_gnu_org:make/make-4.2.1.tar.bz2
  ref: d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589
- kind: patch
  path: patches/make/make-glob_interface_version_2.patch
- kind: patch
  path: patches/make/make-lstat.patch
