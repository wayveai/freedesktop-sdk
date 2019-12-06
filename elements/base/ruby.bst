kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/openssl.bst
- filename: base/libffi.bst
- filename: base/gdbm.bst

# Set '--with-compress-debug-sections=no' because of
# tar_https:bugs.ruby-lang.org/issues/12934
variables:
  conf-local: |
    --enable-pthread \
    --enable-ipv6 \
    --with-compress-debug-sections=no \
    --disable-rpath

sources:
- kind: tar
  url: tar_https:cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.5.tar.gz
  ref: 28a945fdf340e6ba04fc890b98648342e3cccfd6d223a48f3810572f11b2514c
- kind: patch
  path: patches/ruby/ruby-reproducible.patch
