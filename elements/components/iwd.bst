kind: autotools

depends:
- components/dbus.bst

build-depends:
- components/autoconf.bst
- components/automake.bst
- components/libtool.bst
- components/pkg-config.bst
- components/python3-docutils.bst

sources:
- directory: iwd
  kind: git_tag
  url: kernel:network/wireless/iwd.git
  track: master
  ref: 1.7-0-gef6084dcb4fe2e00327bb9c7b113ece204042c22
- directory: ell
  kind: git_tag
  url: kernel:libs/ell/ell.git
  track: master
  ref: 0.31-0-g048f01dd9e416ed2cd3f3aebe5a03959f0f4fb0d

variables:
  autogen: cd iwd; ./bootstrap
  conf-cmd: cd iwd; ./configure
  make: make -C iwd
  make-install: make -C iwd -j1 DESTDIR="%{install-root}" install
  nmconf-wifi-backend: >-
    "%{install-root}/etc/NetworkManager/conf.d/wifi_backend.conf"

config:
  install-commands:
  - %{make-install}
  - mkdir -p $(dirname %{nmconf-wifi-backend})
  - |
    cat > %{nmconf-wifi-backend} <<EOF
    [device]
    wifi.backend=iwd
    EOF
