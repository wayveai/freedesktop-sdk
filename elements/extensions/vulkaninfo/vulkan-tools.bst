kind: cmake

(@): elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/vulkan.bst
- components/glslang.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xrandr.bst
- components/wayland.bst

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
  ref: sdk-1.2.162.1-0-g8f0c2e40d4134f53f82ce48de72c7be92baa6b3d
  track: master
  track-extra:
  - sdk-1.2.162
  match:
  - sdk-*
