kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libffi.bst
- components/gdbm.bst
- components/openssl.bst

# Set '--with-compress-debug-sections=no' because of
# https://bugs.ruby-lang.org/issues/12934
variables:
  conf-local: >-
    --enable-pthread
    --enable-ipv6
    --with-compress-debug-sections=no
    --disable-rpath

sources:
- kind: tar
  url: tar_https:cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.1.tar.xz
  ref: 7aefaa6b78b076515d272ec59c4616707a54fc9f2391239737d5f10af7a16caa

config:
  install-commands:
    # Workaround binary extensions installation issues.
    # https://bugs.ruby-lang.org/issues/18373
    (<):
    - |
      find .bundle -name extconf.rb -exec \
      sed -i \
      -e '/create_makefile/i \$arch_hdrdir = "%{build-root}/%{build-dir}/.ext/include/%{target_arch}-linux"' \
      -e '/create_makefile/i \$DLDFLAGS << " -L%{build-root}/%{build-dir}"' {} \;
