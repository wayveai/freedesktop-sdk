kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: components/vulkan-headers.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrandr.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DCMAKE_INSTALL_SYSCONFDIR:PATH=%{sysconfdir} \
    -DBUILD_TESTS=OFF \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On \

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvulkan.so'

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Loader
  ref: sdk-1.1.114.0-0-gab2bcb97c78a3a086c3d09327de4fb47060a2bbf
  track: master
  match:
  - sdk-*
- kind: patch
  path: patches/vulkan/vulkan-libdir-path.patch
