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
  command-subdir: subprojects/gstreamer

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

(@):
- elements/include/gstreamer-source.yml
