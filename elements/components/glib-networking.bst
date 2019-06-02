kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/libproxy.bst
- filename: components/glib.bst
- filename: components/gnutls.bst
- filename: components/gsettings-desktop-schemas.bst
- filename: components/ca-certificates.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Dlibproxy=enabled

sources:
- kind: git_tag
  url: gnome:glib-networking
  track: master
  track-extra:
  - glib-2-60
  match:
  - 2.*[02468].*
  ref: 2.60.2-0-g87da1042389f0feef2ceac44687eb6a2f685dfa7
