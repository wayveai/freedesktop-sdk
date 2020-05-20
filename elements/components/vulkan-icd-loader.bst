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
    -DBUILD_WSI_WAYLAND_SUPPORT=On

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvulkan.so'

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Loader.git
  ref: sdk-1.2.135.0-0-g86429d9e7f3542e88fb98ffa7d8a82c10c9828ac
  track: master
  track-extra:
  - sdk-1.2.135
  match:
  - sdk-*
- kind: patch
  path: patches/vulkan/vulkan-libdir-path.patch
