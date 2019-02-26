kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
- filename: base/python3.bst
- filename: base/gnupg.bst
- filename: base/curl.bst
- filename: base/openssl.bst
- filename: base/pcre2.bst
- filename: base/expat.bst
- filename: base/libffi.bst
- filename: base/gettext.bst
  type: build
- filename: base/tar.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build


variables:
  builddir: ''
  make: make %{make-args}
  make-install: make -j1 DESTDIR="%{install-root}" install %{make-args}
  make-args: |
    NO_TCLTK=YesPlease \
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
- elements/config/git.yml
