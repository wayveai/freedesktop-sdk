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
    --enable-wired
    --enable-hwsim
    --enable-tools
    --enable-ofono
    --enable-sim-hardcoded

sources:
- kind: git_tag
  url: kernel:network/wireless/iwd.git
  track: master
  ref: 1.8-0-ga01754f56aacdc641c819f983c3c0ad374be77b2
