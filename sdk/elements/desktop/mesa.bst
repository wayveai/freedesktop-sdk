kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/python2-mako.bst
    type: build
  - filename: desktop/llvm6.bst
  - filename: desktop/libdrm.bst
  - filename: desktop/libva.bst
  - filename: desktop/xorg-lib-xdamage.bst
  - filename: desktop/xorg-lib-xfixes.bst
  - filename: desktop/xorg-lib-xshmfence.bst
  - filename: desktop/xorg-lib-xxf86vm.bst
  - filename: desktop/wayland-protocols.bst
    type: build
  - filename: desktop/libglvnd.bst
  - filename: desktop/libvdpau.bst
  - filename: base/libelf.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/python2.bst
    type: build

variables:
  (?):
    - target_arch == "i586" or target_arch == "x86_64":
        gallium_drivers: "svga,swrast,nouveau,r600,r300,radeonsi,virgl"
        dri_drivers: "swrast,nouveau,radeon,r200,i915,i965"
        vulkan_drivers: "intel,radeon"
    - target_arch == "arm" or target_arch == "aarch64":
        gallium_drivers: "swrast,nouveau,freedreno,vc4"
        dri_drivers: "swrast,nouveau,r200"
        vulkan_drivers: ""

  conf-local: |
    --enable-libglvnd \
    --disable-selinux \
    --disable-osmesa \
    --enable-egl \
    --disable-gles1 \
    --enable-gles2 \
    --enable-vdpau \
    --enable-va \
    --enable-xa \
    --disable-xvmc \
    --with-platforms=x11,drm,surfaceless,wayland \
    --enable-shared-glapi \
    --enable-gbm \
    --disable-opencl \
    --enable-glx-tls \
    --enable-texture-float=yes \
    --enable-llvm \
    --enable-llvm-shared-libs \
    --enable-dri \
    --enable-dri3 \
    --with-gallium-drivers=%{gallium_drivers} \
    --with-dri-drivers=%{dri_drivers} \
    --with-vulkan-drivers=%{vulkan_drivers}

config:
  install-commands:
    (>):
      - |
        ln -s libEGL_mesa.so.0 %{install-root}%{libdir}/libEGL_indirect.so.0
        ln -s libGLX_mesa.so.0 %{install-root}%{libdir}/libGLX_indirect.so.0
        rm -f "%{install-root}%{libdir}"/libGLESv2*
        rm -f "%{install-root}%{libdir}/libGLX_mesa.so"
        rm -f "%{install-root}%{libdir}/libEGL_mesa.so"
        # Those files are provided by desktop/wayland.bst
        rm -f "%{install-root}%{libdir}"/libwayland-egl.so*
        rm -f "%{install-root}%{libdir}"/pkgconfig/wayland-egl.pc

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgbm.so"
          - "%{libdir}/libglapi.so"
          - "%{libdir}/libwayland-egl.so"
          - "%{libdir}/libxatracker.so"
          - "%{libdir}/vdpau/libvdpau_*.so"

sources:
  - kind: tar
    url: https://mesa.freedesktop.org/archive/mesa-18.0.4.tar.xz
    ref: 1f3bcfe7cef0a5c20dae2b41df5d7e0a985e06be0183fa4d43b6068fcba2920f
  - kind: patch
    path: patches/mesa-glvnd-fix-gl-dot-pc.patch
  - kind: patch
    path: patches/mesa-Fix-linkage-against-shared-glapi.patch
