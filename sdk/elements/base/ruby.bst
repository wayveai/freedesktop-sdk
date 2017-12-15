kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/openssl.bst
  - filename: base/libffi.bst
  - filename: base/gdbm.bst

variables:
  conf-local: |
    --enable-pthread \
    --enable-ipv6

sources:
  - kind: tar
    url: https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz
    ref: 93b9e75e00b262bc4def6b26b7ae8717efc252c47154abb7392e54357e6c8c9c
