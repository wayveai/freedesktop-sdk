kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-docutils.bst
- components/dbus.bst
- components/systemd.bst

variables:
  build-dir: ''
  conf-local: >-
    --enable-wired
    --enable-hwsim
    --enable-tools
    --enable-ofono
    --enable-sim-hardcoded
  make: make -C iwd
  make-install: make -C iwd -j1 DESTDIR="%{install-root}" install

config:
  configure-commands:
  - |
    cd iwd
    %{autogen}
    ./%{configure}

sources:
- directory: iwd
  kind: git_tag
  url: kernel:network/wireless/iwd.git
  track: master
  ref: 1.28-0-g649ddf696e681528830ef8b358375953e3e18855
- directory: ell
  kind: git_tag
  url: kernel:libs/ell/ell.git
  track: master
  ref: 0.51-0-g097eb093ce162739c35f3bedffa4e15a46873f4a
