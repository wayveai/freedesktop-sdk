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
- kind: git_tag
  url: github:KhronosGroup/Vulkan-ValidationLayers
  ref: v1.1.97-0-g9a4ae980ab4c69d2ae99f13a2c8ea2a5d102af93
