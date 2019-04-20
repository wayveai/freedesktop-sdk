kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/llvm7.bst
  type: build
- filename: components/llvm7-static.bst
  type: build
- filename: components/llvm7.bst
- filename: components/libdrm.bst
- filename: components/libva.bst
- filename: components/libclc.bst
- filename: components/opencl.bst
- filename: components/xorg-lib-xdamage.bst
- filename: components/xorg-lib-xfixes.bst
- filename: components/xorg-lib-xrandr.bst
- filename: components/xorg-lib-xshmfence.bst
- filename: components/xorg-lib-xxf86vm.bst
- filename: components/wayland.bst
- filename: components/wayland-protocols.bst
  type: build
- filename: components/libglvnd.bst
- filename: components/libvdpau.bst
- filename: components/bison.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: components/libunwind.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/python3.bst
  type: build
- filename: components/python3-mako.bst
  type: build
- filename: components/gettext.bst
  type: build

variables:
  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      gallium_drivers: nouveau,r600,r300,radeonsi,svga,swrast,virgl
      dri_drivers: i915,i965,nouveau,r100,r200
      vulkan_drivers: amd,intel
      enable_libunwind: 'true'
  - target_arch == "arm" or target_arch == "aarch64":
      gallium_drivers: etnaviv,freedreno,kmsro,nouveau,swrast,tegra,virgl,v3d,vc4
      dri_drivers: ''
      vulkan_drivers: ''
      enable_libunwind: 'false'

  meson-local: |
    -Db_ndebug=true \
    -Ddri3=true \
    -Ddri-drivers=%{dri_drivers} \
    -Degl=true \
    -Dgallium-drivers=%{gallium_drivers} \
    -Dgallium-nine=true \
    -Dgallium-omx=disabled \
    -Dgallium-opencl=icd \
    -Dgallium-va=true \
    -Dgallium-vdpau=true \
    -Dgallium-xa=true \
    -Dgallium-xvmc=false \
    -Dgbm=true \
    -Dgles1=false \
    -Dgles2=true \
    -Dglvnd=true \
    -Dglx=auto \
    -Dlibunwind=%{enable_libunwind} \
    -Dllvm=true \
    -Dlmsensors=false \
    -Dosmesa=gallium \
    -Dplatforms=x11,drm,surfaceless,wayland \
    -Dselinux=false \
    -Dshared-glapi=true \
    -Dvalgrind=false \
    -Dvulkan-drivers=%{vulkan_drivers} \
    -Dvulkan-icd-dir="%{libdir}/vulkan/icd.d" \
    -Dxlib-lease=true

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{libdir}"
      mv "%{install-root}%{sysconfdir}/OpenCL" "%{install-root}%{libdir}/"
      ln -s libEGL_mesa.so.0 %{install-root}%{libdir}/libEGL_indirect.so.0
      ln -s libGLX_mesa.so.0 %{install-root}%{libdir}/libGLX_indirect.so.0
      rm -f "%{install-root}%{libdir}"/libGLESv2*
      rm -f "%{install-root}%{libdir}/libGLX_mesa.so"
      rm -f "%{install-root}%{libdir}/libEGL_mesa.so"
      rm -f "%{install-root}%{libdir}/libglapi.so"

    - |
      for dir in vdpau dri; do
        for file in "%{install-root}%{libdir}/${dir}/"*.so*; do
          soname="$(objdump -p "${file}" | sed "/ *SONAME */{;s///;q;};d")"
          if [ -L "${file}" ]; then
            continue
          fi
          if ! [ -f "%{install-root}%{libdir}/${dir}/${soname}" ]; then
            mv "${file}" "%{install-root}%{libdir}/${dir}/${soname}"
          else
            rm "${file}"
          fi
          ln -s "${soname}" "${file}"
        done
      done

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgbm.so'
        - '%{libdir}/libglapi.so'
        - '%{libdir}/libOSMesa.so'
        - '%{libdir}/libwayland-egl.so'
        - '%{libdir}/libxatracker.so'
        - '%{libdir}/libMesaOpenCL.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/mesa.git
  track: 19.0
  ref: mesa-19.0.2-0-g2964ee3ad05c4b3d1407aeaa28e2058fe93e1659
