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

public:
  bst:
    split-rules:
      (@): include/_private/exclude-systemd.yml

sources:
- kind: git_tag
  url: gnome:glib-networking.git
  track: master
  track-extra:
  - glib-2-64
  match:
  - 2.64.*
  ref: 2.64.3-0-g533d3a76e2cc622b072e3ec789f69e888f3fd8eb
