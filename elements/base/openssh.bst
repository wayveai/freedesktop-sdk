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
    ref: 71508e06fab14bc415a79a08f5535ad7bffa93d9  # V_7_8_P1
