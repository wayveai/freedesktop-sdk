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
  url: https://www.kernel.org/pub/linux/utils/boot/syslinux/6.xx/syslinux-6.03.tar.xz
  ref: 26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e

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
