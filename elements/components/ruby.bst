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
  url: tar_https:cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.1.tar.xz
  ref: b224f9844646cc92765df8288a46838511c1cec5b550d8874bd4686a904fcee7
