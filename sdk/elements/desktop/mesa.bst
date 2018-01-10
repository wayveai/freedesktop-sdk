kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/llvm5.bst
    type: build
  - filename: desktop/libdrm.bst
  - filename: desktop/xorg-proto-dri2.bst
  - filename: desktop/xorg-proto-dri3.bst
  - filename: desktop/xorg-proto-present.bst
  - filename: desktop/xorg-lib-xdamage.bst
  - filename: desktop/xorg-lib-xfixes.bst
  - filename: desktop/xorg-lib-xshmfence.bst
  - filename: desktop/xorg-lib-xxf86vm.bst
  - filename: desktop/wayland-protocols.bst
    type: build
  - filename: desktop/libglvnd.bst

variables:
  (?):
    - target_arch == "i586" or target_arch == "x86_64":
        gallium_drivers: "svga,swrast,nouveau,r600,r300,radeonsi"
        dri_drivers: "swrast,nouveau,radeon,r200,i915,i965"
    - target_arch == "arm" or target_arch == "aarch64":
        gallium_drivers: "swrast,nouveau,freedreno,vc4"
        dri_drivers: "swrast,nouveau,radeon,r200"

  conf-local: |
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
    --enable-dri3 \
    --with-gallium-drivers=%{gallium_drivers} \
    --with-dri-drivers=%{dri_drivers}

config:
  install-commands:
    (>):
      - |
        ln -s libEGL_mesa.so.0 %{install-root}%{libdir}/libEGL_indirect.so.0
        ln -s libGLX_mesa.so.0 %{install-root}%{libdir}/libGLX_indirect.so.0
        rm -f "%{install-root}%{libdir}"/libGLESv2*
        rm -f "%{install-root}%{libdir}/libGLX_mesa.so"
        rm -f "%{install-root}%{libdir}/libEGL_mesa.so"

sources:
  - kind: tar
    url: https://mesa.freedesktop.org/archive/mesa-17.3.2.tar.xz
    ref: e2844a13f2d6f8f24bee65804a51c42d8dc6ae9c36cff7ee61d0940e796d64c6
  - kind: patch
    path: elements/desktop/mesa-glvnd-fix-gl-dot-pc.patch
  - kind: patch
    path: elements/desktop/mesa-Fix-linkage-against-shared-glapi.patch
