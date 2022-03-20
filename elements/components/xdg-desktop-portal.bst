kind: filter

build-depends:
- components/xdg-desktop-portal-base.bst

runtime-depends:
- components/xdg-desktop-portal-manifest.bst
- components/xdg-portal-interfaces.bst
- components/flatpak.bst
- components/fuse3.bst
- components/glib.bst
- components/fontconfig.bst
- components/pipewire-daemon.bst
- components/geoclue.bst

config:
  include-orphans: true
  exclude:
  - interfaces
