kind: meson

build-depends:
- components/gtk-doc.bst
- public-stacks/buildsystem-meson.bst
- components/dbus.bst

depends:
- bootstrap-import.bst
- components/libdbus.bst
- components/glib.bst

variables:
  meson-local: >-
    -Dx11=no

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatspi.so'
      (@): include/_private/exclude-systemd.yml

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-core.git
  track: master
  track-extra:
  - gnome-42
  match:
  - AT_SPI2_CORE_*_*[02468]_*
  ref: AT_SPI2_CORE_2_44_0-0-gf38e40e8685400ddb66759aa009e18c12c898de4
- kind: patch
  path: patches/at-spi2-core/Fix-build-with-X11-disabled.patch
