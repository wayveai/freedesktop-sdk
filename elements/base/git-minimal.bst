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
- kind: git_tag
  url: https://github.com/git/git.git
  track: master
  ref: v2.19.1-0-gcae598d9980661a978e2df4fb338518f7bf09572
    # git-minimal.bst and git.bst must be kept in sync
