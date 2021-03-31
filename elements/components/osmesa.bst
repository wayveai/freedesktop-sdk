kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3-mako.bst
- components/llvm.bst
- components/bison.bst
- components/flex.bst

depends:
- bootstrap-import.bst

runtime-depends:
- components/mesa-headers.bst

(@):
- elements/include/mesa.yml

variables:
  meson-local: |
    -Db_ndebug=true \
    -Dplatforms="" \
    -Dopengl=true \
    -Dglx=disabled \
    -Degl=disabled \
    -Dgles1=disabled \
    -Dgles2=disabled \
    -Dllvm=enabled \
    -Dmicrosoft-clc=disabled \
    -Dosmesa=true \
    -Ddri-drivers="" \
    -Dgallium-drivers="swrast" \
    -Dvulkan-drivers="" \
    -Dgbm=disabled \
    -Dshared-glapi=disabled

config:
  install-commands:
    (>):
    - |
      # Those are provided by desktop/mesa-headers.bst
      rm -rf "%{install-root}%{includedir}"
      # Only a file for configuration tweaks with different applications.
      # Not relevant for off-screen software rendering.
      rm -rf "%{install-root}%{datadir}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libOSMesa.so'
