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
  url: https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.3.tar.gz
  ref: 9828d03852c37c20fa333a0264f2490f07338576734d910ee3fd538c9520846c
- kind: patch
  path: patches/ruby-reproducible.patch
