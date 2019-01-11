kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build
- filename: desktop/glslang.bst
  type: build
- filename: desktop/mesa.bst
- filename: desktop/spirv-tools.bst
  type: build
- filename: desktop/wayland.bst
- filename: desktop/vulkan-headers.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xcb.bst
- filename: desktop/xorg-lib-xrandr.bst

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DGLSLANG_INSTALL_DIR=%{prefix}

sources:
- kind: tar
  url: github:KhronosGroup/Vulkan-ValidationLayers/archive/v1.1.96.tar.gz
  ref: 89aefb8f5e3f77f1cff9b23165fb8d4f7a718742b0dea698d93b20e3df112047
