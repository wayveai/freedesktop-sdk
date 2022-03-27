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
  track: glib-2-68
  match:
  - 2.*[02468].*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 2.68.3-0-gdf25a5f963b5f60839e65b03936879fa1586235c
