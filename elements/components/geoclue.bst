kind: meson

build-depends:
- components/gtk-doc.bst
- components/gobject-introspection.bst
- components/vala.bst
- public-stacks/buildsystem-meson.bst

depends:
- filename: bootstrap-import.bst
- filename: components/json-glib.bst
- filename: components/glib.bst
- filename: components/libsoup.bst

variables:
  meson-local: |
    -D3g-source=false \
    -Dcdma-source=false \
    -Dmodem-gps-source=false \
    -Dnmea-source=false \
    -Ddemo-agent=false

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{datadir}/applications"
      rm -r "%{install-root}%{sysconfdir}/dbus-1/system.d"
      rm -r "%{install-root}%{libexecdir}"
      rm -r "%{install-root}%{datadir}/dbus-1/system-services"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{datadir}/dbus-1/interfaces/org.freedesktop.GeoClue2*'
        - '%{libdir}/libgeoclue-2.so'

sources:
- kind: git_tag
  url: freedesktop:geoclue/geoclue.git
  track: master
  track-extra:
  - 2.5.x
  ref: 2.6.0-0-g10998ca3215fb6d21b5a32fdf78bb5feffaf4c0f
