kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/libproxy.bst
- filename: components/glib.bst
- filename: components/gnutls.bst
- filename: components/gsettings-desktop-schemas.bst
- filename: components/ca-certificates.bst
- filename: components/gettext.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Dlibproxy_support=true

sources:
- kind: git_tag
  url: gnome:glib-networking
  track: master
  ref: 2.58.0-0-gbd8ef31a4ca4552a10b8fe7897662a2b235f6e6f
