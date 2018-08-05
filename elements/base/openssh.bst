kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/openssl.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build

variables:
  conf-local: |
    --with-mantype=man

sources:
  - kind: git
    url: https://github.com/openssh/openssh-portable
    ref: a0349a1cc4a18967ad1dbff5389bcdf9da098814  # 7.7p1
