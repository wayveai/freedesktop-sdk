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
  ref: 1.18.4-0-geacb7aa8d12f66a3ff1970c149210972f6079b56
