kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

depends:
- bootstrap-import.bst
- components/systemd-libs.bst

variables:
  conf-local: >-
    --with-ncurses
    --with-systemd

  builddir: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libprocps.so'

sources:
- kind: git_tag
  url: gitlab:procps-ng/procps.git
  track: master
  exclude:
  - '*rc*'
  ref: v3.3.16-0-g59c88e18f29000ceaf7e5f98181b07be443cf12f
