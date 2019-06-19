kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libffi.bst
- filename: components/gdbm.bst

# Set '--with-compress-debug-sections=no' because of
# https://bugs.ruby-lang.org/issues/12934
variables:
  conf-local: |
    --enable-pthread \
    --enable-ipv6 \
    --with-compress-debug-sections=no \
    --disable-rpath

sources:
- kind: tar
  url: https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.3.tar.gz
  ref: 577fd3795f22b8d91c1d4e6733637b0394d4082db659fccf224c774a2b1c82fb
