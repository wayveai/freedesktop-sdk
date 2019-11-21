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
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Tools.git
  ref: v1.1.97-0-gff56a741b1cce8ae20ff6276f51100e668e9c4f5
