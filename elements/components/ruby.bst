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
  url: tar_https:cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.4.tar.xz
  ref: df593cd4c017de19adf5d0154b8391bb057cef1b72ecdd4a8ee30d3235c65f09
