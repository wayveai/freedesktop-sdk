kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: desktop/vulkan.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xrandr.bst
- filename: desktop/wayland.bst
- filename: base/buildsystem-cmake.bst
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
- kind: tar
  url: github:KhronosGroup/Vulkan-Tools/archive/v1.1.96.tar.gz
  ref: 18c173b2f58fadccc53c7636cf1f6eb3dc46579643ef2d23fd9c6106dd06db18
