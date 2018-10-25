kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
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
  url: https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz
  ref: dac81822325b79c3ba9532b048c2123357d3310b2b40024202f360251d9829b1
- kind: patch
  path: patches/ruby-reproducible.patch
