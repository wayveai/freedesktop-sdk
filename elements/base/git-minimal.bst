kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/tar.bst
  type: build

variables:
  builddir: ''
  make: make %{make-args}
  make-install: make -j1 DESTDIR="%{install-root}" install %{make-args}
  make-args: |
    NO_TCLTK=YesPlease \
    NO_OPENSSL=YesPlease \
    NO_CURL=YesPlease \
    NO_GETTEXT=YesPlease \
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
