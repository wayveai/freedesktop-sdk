kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/llvm6.bst
- filename: desktop/libdrm.bst
- filename: desktop/libva.bst
- filename: desktop/libclc.bst
- filename: desktop/opencl.bst
- filename: desktop/xorg-lib-xdamage.bst
- filename: desktop/xorg-lib-xfixes.bst
- filename: desktop/xorg-lib-xrandr.bst
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
- filename: base/libunwind.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/python2.bst
  type: build
- filename: base/python2-mako.bst
  type: build

variables:
  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      gallium_drivers: svga,swrast,nouveau,r600,r300,radeonsi,virgl
      dri_drivers: nouveau,r100,r200,i915,i965
      vulkan_drivers: intel,amd
      enable_libunwind: 'true'
  - target_arch == "arm" or target_arch == "aarch64":
      gallium_drivers: pl111,vc4,freedreno,etnaviv,imx,nouveau,tegra,virgl,swrast
      dri_drivers: ''
      vulkan_drivers: ''
      enable_libunwind: 'false'

  meson-local: |
    -Dglvnd=true \
    -Dlibunwind=%{enable_libunwind} \
    -Dselinux=false \
    -Dosmesa=none \
    -Degl=true \
    -Dgles1=false \
    -Dgles2=true \
    -Dgallium-omx=disabled \
    -Dgallium-nine=true \
    -Dgallium-vdpau=true \
    -Dgallium-va=true \
    -Dgallium-xa=true \
    -Dgallium-xvmc=false \
    -Dgallium-opencl=icd \
    -Dplatforms=x11,drm,surfaceless,wayland \
    -Dshared-glapi=true \
    -Dgbm=true \
    -Dglx=auto \
    -Dtexture-float=true \
    -Dllvm=true \
    -Ddri3=true \
    -Dxlib-lease=true \
    -Dgallium-drivers=%{gallium_drivers} \
    -Ddri-drivers=%{dri_drivers} \
    -Dvulkan-drivers=%{vulkan_drivers} \
    -Dvulkan-icd-dir="%{libdir}/vulkan/icd.d"

config:
  install-commands:
    (>):
    - |
      mkdir -p %{install-root}%{indep-libdir}/OpenCL/vendors
      mv %{install-root}%{sysconfdir}/OpenCL/vendors/* %{install-root}%{indep-libdir}/OpenCL/vendors
      ln -s libEGL_mesa.so.0 %{install-root}%{libdir}/libEGL_indirect.so.0
      ln -s libGLX_mesa.so.0 %{install-root}%{libdir}/libGLX_indirect.so.0
      rm -f "%{install-root}%{libdir}"/libGLESv2*
      rm -f "%{install-root}%{libdir}/libGLX_mesa.so"
      rm -f "%{install-root}%{libdir}/libEGL_mesa.so"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgbm.so'
        - '%{libdir}/libglapi.so'
        - '%{libdir}/libwayland-egl.so'
        - '%{libdir}/libxatracker.so'
        - '%{libdir}/vdpau/libvdpau_*.so'
        - '%{libdir}/libMesaOpenCL.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/mesa.git
  ref: mesa-18.2.5-0-gf34bddc325c414cb8ee21666bd307512577efdef
