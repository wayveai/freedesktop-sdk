kind: cmake

(@): elements/extensions/include/app.yml

depends:
- filename: bootstrap-import.bst
- filename: components/vulkan.bst
- filename: components/glslang.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrandr.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DBUILD_CUBE=ON \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Tools
  ref: sdk-1.1.114.0-0-g462ad675c0e137641ef3adc1aefba7e0d6ac2ce0
  track: master
  track-extra:
  - sdk-1.1.114
  match:
  - sdk-*
