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
  #track-extra:
  #- glib-2-66
  match:
  - 2.*[02468].*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 2.66.0-0-g61d7e024ca354e6d2e39930d66a2067f3de5842c
