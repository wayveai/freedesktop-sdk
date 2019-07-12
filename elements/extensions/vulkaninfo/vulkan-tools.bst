kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: components/vulkan.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrandr.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DBUILD_CUBE=OFF \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On

config:
  install-commands:
    (>):
    - |
      mv  %{install-root}/usr %{install-root}/app

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Tools
  ref: sdk-1.1.108.0-0-g3ccd7f6ebae3e1919adf837718c04feb6c2acc61
  track: master
  match:
  - sdk-*
