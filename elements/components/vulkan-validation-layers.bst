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

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-ValidationLayers.git
  ref: sdk-1.2.148.0-0-g91cb71f2fa0c4d710cf188e89b4f7d1a2a0e5879
  track: master
  track-extra:
  - sdk-1.2.148
  match:
  - sdk-*
