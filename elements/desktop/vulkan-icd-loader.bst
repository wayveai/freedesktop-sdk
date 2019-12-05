kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: desktop/vulkan-headers.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xrandr.bst
- filename: desktop/wayland.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DBUILD_VKJSON=OFF \
    -DBUILD_WSI_MIR_SUPPORT=OFF \
    -DCMAKE_INSTALL_SYSCONFDIR:PATH=%{sysconfdir} \
    -DBUILD_TESTS=OFF \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On \
    -DBUILD_DEMOS=OFF \
    -DBUILD_LAYERS=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvulkan.so'

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Loader.git
  ref: v1.1.97-0-g5aa64df4a913388e896abf6567548ec6712084bb
- kind: patch
  path: patches/vulkan/vulkan-libdir-path.patch
