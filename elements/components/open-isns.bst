kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  make-install: make -j1 install install_hdrs install_lib DESTDIR="%{install-root}"
  local_flags: >-
    -Wno-error

sources:
- kind: git_tag
  url: github:open-iscsi/open-isns.git
  track: master
  ref: v0.101-0-g0d86dc31fae2e2d77a082ccea5aba95426b40c3c
