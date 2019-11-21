kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/libproxy.bst
- filename: base/glib.bst
- filename: base/gnutls.bst
- filename: desktop/gsettings-desktop-schemas.bst
- filename: base/ca-certificates.bst
- filename: base/gettext.bst
- filename: base/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Dlibproxy_support=true

sources:
- kind: git_tag
  url: gnome:glib-networking.git
  track: master
  ref: 2.58.0-0-gbd8ef31a4ca4552a10b8fe7897662a2b235f6e6f
