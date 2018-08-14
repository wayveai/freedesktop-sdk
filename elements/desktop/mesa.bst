kind: meson

depends:
  - filename: bootstrap-import.bst
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
  - filename: base/bison.bst
    type: build
  - filename: base/flex.bst
    type: build
  - filename: base/meson.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/python2.bst
    type: build
  - filename: base/python2-mako.bst
    type: build

variables:
  (?):
    - target_arch == "i586" or target_arch == "x86_64":
        gallium_drivers: "svga,swrast,nouveau,r600,r300,radeonsi,virgl"
        dri_drivers: "nouveau,r100,r200,i915,i965"
        vulkan_drivers: "intel,amd"
    - target_arch == "arm" or target_arch == "aarch64":
        gallium_drivers: "pl111,vc4,freedreno,etnaviv,imx,nouveau,tegra,virgl,swrast"
        dri_drivers: ""
        vulkan_drivers: ""

  meson-local: |
    -Dglvnd=true \
    -Dselinux=false \
    -Dosmesa=none \
    -Degl=true \
    -Dgles1=false \
    -Dgles2=true \
    -Dgallium-omx=disabled \
    -Dgallium-vdpau=true \
    -Dgallium-va=true \
    -Dgallium-xa=true \
    -Dgallium-xvmc=false \
    -Dplatforms=x11,drm,surfaceless,wayland \
    -Dshared-glapi=true \
    -Dgbm=true \
    -Dgallium-opencl=disabled \
    -Dglx=auto \
    -Dtexture-float=true \
    -Dllvm=true \
    -Ddri3=true \
    -Dgallium-drivers=%{gallium_drivers} \
    -Ddri-drivers=%{dri_drivers} \
    -Dvulkan-drivers=%{vulkan_drivers}

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
    url: https://mesa.freedesktop.org/archive/mesa-18.1.6.tar.xz
    ref: bb7ce759069801804fcfb8152da3457f76cd7b4e0096e4870ff5adcb5c894289
  - kind: patch
    path: patches/mesa-Fix-linkage-against-shared-glapi.patch
