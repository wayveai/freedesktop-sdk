kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/openssl.bst

variables:
  conf-local: |
    --with-mantype=man

sources:
  - kind: tar
    url: https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.6p1.tar.gz
    ref: a323caeeddfe145baaa0db16e98d784b1fbc7dd436a6bf1f479dfd5cd1d21723
