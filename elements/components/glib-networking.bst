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
  url: gnome:glib-networking
  track: master
  track-extra:
  - glib-2-60
  match:
  - 2.*[02468].*
  ref: 2.60.3-0-g164ea6742288022e20cb9314e4ada28323e922d1
