kind: manual

build-depends:
- bootstrap-import.bst
- components/perl.bst
- components/nasm.bst
- components/util-linux-full.bst

sources:
- kind: tar
  url: tar_https:mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/Testing/6.04/syslinux-6.04-pre1.tar.xz
  ref: 3f6d50a57f3ed47d8234fd0ab4492634eb7c9aaf7dd902f33d3ac33564fd631d
- kind: patch
  path: patches/syslinux/extlinux-fix-missing header.patch

config:
  build-commands:
  - make installer CC="gcc -fcommon"
  install-commands:
  - make INSTALLROOT="%{install-root}" MANDIR="%{mandir}" SBINDIR="%{sbindir}" install CC="gcc -fcommon"

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
