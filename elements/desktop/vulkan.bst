kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xrandr.bst
- filename: desktop/wayland.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  lib: lib/%{gcc_triplet}

  cmake-local: |
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DBUILD_VKJSON=OFF \
    -DBUILD_WSI_MIR_SUPPORT=OFF \
    -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc \
    -DGLSLANG_SPIRV_INCLUDE_DIR=./ \
    -DBUILD_TESTS=OFF \
    -DBUILD_DEMOS=OFF \
    -DBUILD_LAYERS=OFF

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{libdir}/GL/vulkan/icd.d"
      mkdir -p "%{install-root}%{sysconfdir}"
      ln -s "%{libdir}/GL/vulkan" "%{install-root}%{sysconfdir}/vulkan"
      mkdir -p "%{install-root}%{datadir}/vulkan/icd.d"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvulkan.so'

sources:
- kind: tar
  url: https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/sdk-1.1.73.0.tar.gz
  ref: ab6bd8162b246bc5d73dcfb3b69ed7a35b12b739735493f47304b0fc852463e1
- kind: patch
  path: patches/vulkan-libdir-path.patch

