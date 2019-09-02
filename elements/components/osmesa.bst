kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/python3-mako.bst
  type: build
- filename: components/llvm.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

- filename: components/mesa-headers.bst
  type: runtime

(@):
- elements/include/mesa.yml

variables:
  meson-local: |
    -Db_ndebug=true \
    -Dplatforms=drm \
    -Dopengl=true \
    -Dglx=disabled \
    -Degl=false \
    -Dgles1=false \
    -Dgles2=false \
    -Dllvm=true \
    -Dosmesa=gallium \
    -Ddri-drivers="" \
    -Dgallium-drivers="swrast" \
    -Dvulkan-drivers="" \
    -Dgbm=false \
    -Dshared-glapi=false

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
