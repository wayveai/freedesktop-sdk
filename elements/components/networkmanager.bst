kind: meson

build-depends:
- components/gobject-introspection.bst
- components/libxslt.bst
- components/perl.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/util-linux-full.bst
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
  - nm-1-34
  - nm-1-36
  exclude:
  - "*-dev*"
  - "*-rc*"
  ref: 1.34.0-0-g9133a30c9deb3a003a20b09a617a25b07ada18ae
- kind: patch
  path: patches/networkmanager/gettext.patch
