kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/flatpak.bst
  type: build
- filename: components/glib.bst
  type: build
- filename: components/fontconfig.bst
  type: build
- filename: components/pipewire.bst
  type: build
- filename: components/geoclue.bst
  type: build

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
  track: master
  ref: 1.4.2-0-gf8604e337f474f053ce4c1e565bde7089d212c91
