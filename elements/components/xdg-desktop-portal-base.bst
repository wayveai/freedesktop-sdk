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
  - xdg-desktop-portal-1.14
  ref: 1.14.4-0-g7a442e6133a931e66b2dd7cad2a13b73a112f010
