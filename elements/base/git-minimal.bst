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

sources:
- kind: git_tag
  url: github:git/git.git
  track: master
  ref: v2.20.1-0-g0d0ac3826a3bbb9247e39e12623bbcfdd722f24c
    # git-minimal.bst and git.bst must be kept in sync
