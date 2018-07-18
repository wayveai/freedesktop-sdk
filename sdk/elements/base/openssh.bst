kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/openssl.bst

variables:
  conf-local: |
    --with-mantype=man

sources:
  - kind: tar
    url: https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.7p1.tar.gz
    ref: d73be7e684e99efcd024be15a30bffcbe41b012b2f7b3c9084aed621775e6b8f
