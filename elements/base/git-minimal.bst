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
    prefix=%{prefix}

config:
  configure-commands: []

  install-commands:
    (>):
      - |
        find "%{install-root}" -type f -name perllocal.pod -delete

sources:
  - kind: tar
    url: https://github.com/git/git/archive/v2.19.0.tar.gz
    ref: c4146d94d1c74de0d099bcd6ba22cc44f799332a46146ede4ad9c9f67971aa28
