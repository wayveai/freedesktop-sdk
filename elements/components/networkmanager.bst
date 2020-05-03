kind: meson

build-depends:
- components/gobject-introspection.bst
- components/libxslt.bst
- components/perl.bst
- components/pygobject.bst
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

variables:
  meson-local: >-
    -Dpolkit=false
    -Dppp=false
    -Dmodem_manager=false
    -Dqt=false

sources:
- kind: git_tag
  url: freedesktop:NetworkManager/NetworkManager.git
  track: master
  ref: 1.21.2-dev-0-ge28460819c0fb1022a153ab8336841f4aae913dd
- kind: patch
  path: patches/networkmanager/gettext.patch
