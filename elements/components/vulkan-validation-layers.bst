kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/glslang.bst
  type: build
- filename: components/spirv-headers.bst
  type: build
- filename: components/spirv-tools.bst
  type: build
- filename: components/wayland.bst
- filename: components/vulkan-headers.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xcb.bst
- filename: components/xorg-lib-xrandr.bst

variables:
  optimize-debug: "false"

  cmake-local: >-
    -DCMAKE_INSTALL_INCLUDEDIR="%{includedir}/vulkan/"
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DGLSLANG_INSTALL_DIR=%{prefix}
    -DSPIRV_HEADERS_INSTALL_DIR=%{prefix}

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-ValidationLayers.git
  ref: sdk-1.2.170.0-0-g4fdcd0eebfed3505732720fc6fd98293e847d697
  track: master
  track-extra:
  - sdk-1.2.170
  match:
  - sdk-*
