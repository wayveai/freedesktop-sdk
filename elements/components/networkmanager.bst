kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/util-linux.bst
- filename: components/systemd.bst
- filename: components/dbus.bst
- filename: components/glib.bst
- filename: components/gobject-introspection.bst
- filename: components/libselinux.bst
- filename: components/gnutls.bst
- filename: components/nss.bst
- filename: components/libpsl.bst
- filename: components/curl.bst
- filename: components/perl.bst
  type: build
- filename: components/libxslt.bst
  type: build

- filename: components/pygobject.bst
- filename: components/libndp.bst
- filename: components/audit.bst
- filename: components/jansson.bst
- filename: components/newt.bst

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
