kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libffi.bst
- components/gdbm.bst

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
  url: tar_https:cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.0.tar.xz
  ref: 68bfaeef027b6ccd0032504a68ae69721a70e97d921ff328c0c8836c798f6cb1
