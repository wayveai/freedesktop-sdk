kind: autotools

depends:
- bootstrap-import.bst
- components/ell.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-docutils.bst
- components/dbus.bst
- components/systemd.bst

variables:
  conf-local: >-
    --enable-external-ell

sources:
- kind: git_tag
  url: kernel:network/wireless/iwd.git
  track: master
  ref: 1.7-0-gef6084dcb4fe2e00327bb9c7b113ece204042c22
