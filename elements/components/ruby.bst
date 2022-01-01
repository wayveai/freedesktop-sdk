kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/openssl1.bst

depends:
- bootstrap-import.bst
- components/libffi.bst
- components/gdbm.bst

runtime-depends:
- components/openssl1-runtime.bst

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
  url: tar_https:cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.2.tar.xz
  ref: 570e7773100f625599575f363831166d91d49a1ab97d3ab6495af44774155c40
