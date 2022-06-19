kind: meson

build-depends:
- components/gobject-introspection.bst
- components/libxslt.bst
- components/perl.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/util-linux.bst
- components/systemd.bst
- components/dbus.bst
- components/glib.bst
- components/gnutls.bst
- components/nss.bst
- components/libpsl.bst
- components/curl.bst
- components/pygobject.bst
- components/libndp.bst
- components/audit.bst
- components/jansson.bst
- components/newt.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Diwd=true
    -Dpolkit=true
    -Dppp=false
    -Dmodem_manager=false
    -Dqt=false

sources:
- kind: git_tag
  url: freedesktop:NetworkManager/NetworkManager.git
  track: master
  track-extra:
  - nm-1-32
  exclude:
  - "*-dev*"
  - "*-rc*"
  ref: 1.32.12-0-gd90c03b1b8f3e6f5ff8fbc1cbc176f0a0dec6362
- kind: patch
  path: patches/networkmanager/gettext.patch
