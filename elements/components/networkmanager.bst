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
- components/libselinux.bst
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
  - nm-1-26
  exclude:
  - "*-dev*"
  - "*-rc*"
  ref: 1.26.4-0-gd256565e57af6e7f707be3f0d415eb2f225c4b78
- kind: patch
  path: patches/networkmanager/gettext.patch
