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
  ref: 1.27-0-g099700a154030624c6e76e0e75f5f66c6ff255dc
- directory: ell
  kind: git_tag
  url: kernel:libs/ell/ell.git
  track: master
  ref: 0.50-0-gbb1e2858a4592087b06db01e9c39ad2bc800ffc3
