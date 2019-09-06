kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
- filename: components/python3.bst
- filename: components/gnupg.bst
- filename: components/curl.bst
- filename: components/pcre2.bst
- filename: components/expat.bst
- filename: components/libffi.bst
- filename: components/tar.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/ca-certificates.bst
  type: runtime


variables:
  builddir: ''
  make: make %{make-args}
  make-install: make -j1 DESTDIR="%{install-root}" install %{make-args}
  make-args: |
    NO_TCLTK=YesPlease \
    INSTALL_SYMLINKS=1 \
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    prefix=%{prefix}

config:
  configure-commands: []

  install-commands:
    (>):
    - |
      find "%{install-root}" -type f -name perllocal.pod -delete

(@):
- elements/include/git.yml
