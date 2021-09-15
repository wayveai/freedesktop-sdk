kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst
- components/flex.bst
- components/bison.bst
- components/hotdoc.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/libunwind-maybe.bst

variables:
  libexecdir: "%{libdir}"
  libunwind: enabled
  (?):
  - target_arch == "riscv64":
      libunwind: disabled
  meson-local: >-
    -Dexamples=disabled
    -Dbenchmarks=disabled
    -Dintrospection=enabled
    -Dlibunwind='%{libunwind}'
    -Dlibdw=enabled
    -Ddbghelp=disabled
    -Dbash-completion=disabled
    -Dpackage-origin="freedesktop-sdk"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgstcheck-1.0.so'
        - '%{libdir}/libgstbase-1.0.so'
        - '%{libdir}/libgstnet-1.0.so'
        - '%{libdir}/libgstreamer-1.0.so'
        - '%{libdir}/libgstcontroller-1.0.so'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gstreamer.git
  track: master
  track-extra:
  - '1.18'
  match:
  - 1.*[02468].*
  ref: 1.18.5-0-g71c213f99ad5c8fc8f36a26238483f2bdf7d846a
