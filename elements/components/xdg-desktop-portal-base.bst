kind: autotools

depends:
- bootstrap-import.bst
- components/libportal.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flatpak.bst
- components/fuse3.bst
- components/glib.bst
- components/fontconfig.bst
- components/pipewire.bst
- components/geoclue.bst

public:
  bst:
    split-rules:
      interfaces:
      - "%{datadir}/pkgconfig/*.pc"
      - "%{datadir}/dbus-1/interfaces"
      - "%{datadir}/dbus-1/interfaces/org.freedesktop.portal*"

sources:
- kind: git_tag
  url: github:flatpak/xdg-desktop-portal.git
  track: main
  track-extra:
  - xdg-desktop-portal-1.12
  ref: 1.14.1-0-g6e9ab0bfdc82043b4b27b5e4f77da982ac010587
