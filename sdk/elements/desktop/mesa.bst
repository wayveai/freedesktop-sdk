kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/llvm5.bst
    type: build
  - filename: desktop/libglvnd.bst
  - filename: desktop/libdrm.bst
  - filename: desktop/xorg-proto-dri2.bst
  - filename: desktop/xorg-lib-xdamage.bst
  - filename: desktop/xorg-lib-xfixes.bst
  - filename: desktop/xorg-lib-xshmfence.bst
  - filename: desktop/wayland-protocols.bst

variables:
  (?):
    - target_arch == "i586" or target_arch == "x86_64":
        gallium_drivers: "svga,swrast,nouveau,r600,r300,radeonsi"
        dri_drivers: "swrast,nouveau,radeon,r200,i915,i965"
    - target_arch == "arm" or target_arch == "aarch64":
        gallium_drivers: "swrast,nouveau,freedreno,vc4"
        dri_drivers: "swrast,nouveau,radeon,r200"

  conf-extra: |
    --enable-libglvnd \
    --disable-selinux \
    --disable-osmesa \
    --enable-egl \
    --disable-gles1 \
    --enable-gles2 \
    --disable-xvmc \
    --with-platforms=x11,drm,surfaceless,wayland \
    --enable-shared-glapi \
    --enable-gbm \
    --disable-opencl \
    --enable-glx-tls \
    --enable-texture-float=yes \
    --enable-llvm \
    --disable-llvm-shared-libs \
    --enable-dri \
    --with-gallium-drivers=%{gallium_drivers} \
    --with-dri-drivers=%{dri_drivers}

sources:
  - kind: tar
    url: https://mesa.freedesktop.org/archive/mesa-17.2.2.tar.xz
    ref: cf522244d6a5a1ecde3fc00e7c96935253fe22f808f064cab98be6f3faa65782
