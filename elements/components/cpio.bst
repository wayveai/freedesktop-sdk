kind: autotools

depends:
- bootstrap-import.bst
- components/tar.bst

variables:
  conf-local: >-
    --with-rmt="%{libexecdir}/rmt"

config:
  install-commands:
    (>):
    # man8 is empty and this causes issue with compose element.
    - rm -rf "%{install-root}%{mandir}/man8"

sources:
- kind: tar
  url: ftp_gnu_org:cpio/cpio-2.13.tar.bz2
  ref: eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d
- kind: patch
  path: patches/cpio/gcc10-fno-common.patch
