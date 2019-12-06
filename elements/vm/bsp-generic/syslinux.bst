kind: manual

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/perl.bst
  type: build
- filename: base/nasm.bst
  type: build
- filename: base/util-linux.bst
  type: build

sources:
- kind: tar
  url: tar_https:mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/Testing/6.04/syslinux-6.04-pre1.tar.xz
  ref: 3f6d50a57f3ed47d8234fd0ab4492634eb7c9aaf7dd902f33d3ac33564fd631d
- kind: patch
  path: patches/syslinux/extlinux-fix-missing header.patch

config:
  build-commands:
  - make installer
  install-commands:
  - make INSTALLROOT="%{install-root}" MANDIR="%{mandir}" SBINDIR="%{sbindir}" install

public:
  bst:
    split-rules:
      runtime:
        (>):
        - |
          %{datadir}/syslinux
        - |
          %{datadir}/syslinux/*
        - |
          %{datadir}/syslinux/diag/*
        - |
          %{datadir}/syslinux/dosutil/*

      devel:
        (>):
        - |
          %{datadir}/syslinux/com32/**
