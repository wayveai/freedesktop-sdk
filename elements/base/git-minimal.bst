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
  - kind: git
    url: https://github.com/git/git.git
    ref: cae598d9980661a978e2df4fb338518f7bf09572 # v2.19.1
    # git-minimal.bst and git.bst must be kept in sync