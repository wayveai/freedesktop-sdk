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
  url: github:KhronosGroup/Vulkan-Tools.git
  ref: sdk-1.2.135.0-0-g6d8197fd6c91d352a601587ffdde28f4cd7bc399
  track: master
  track-extra:
  - sdk-1.2.135
  match:
  - sdk-*
