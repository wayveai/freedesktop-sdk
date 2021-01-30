kind: meson

build-depends:
- components/bison.bst
- components/flex.bst
- components/python3.bst
- components/python3-mako.bst
- components/vulkan.bst
- components/wayland-protocols.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/glslang.bst
- extensions/mesa/llvm.bst
- components/libdrm.bst
- components/libva.bst
- components/libclc.bst
- components/opencl.bst
- components/xorg-lib-xdamage.bst
- components/xorg-lib-xfixes.bst
- components/xorg-lib-xrandr.bst
- components/xorg-lib-xshmfence.bst
- components/xorg-lib-xxf86vm.bst
- components/wayland.bst
- components/libglvnd.bst
- components/libvdpau.bst
- components/libunwind.bst
- extensions/mesa/libdrm.bst

environment:
  PKG_CONFIG_PATH: "%{libdir}/pkgconfig:"
  PATH: "%{bindir}:/usr/bin"
  CXXFLAGS: "%{target_flags} -std=gnu++17"

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/default"
  lib: "lib"
  debugdir: "/usr/lib/debug"

  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      gallium_drivers: iris,nouveau,r300,r600,radeonsi,svga,swrast,virgl,zink
      dri_drivers: i915,i965,nouveau,r100,r200
      vulkan_drivers: amd,intel
      enable_libunwind: 'true'
  - target_arch == "arm" or target_arch == "aarch64":
      gallium_drivers: etnaviv,freedreno,kmsro,lima,nouveau,panfrost,swrast,tegra,virgl,v3d,vc4,zink
      dri_drivers: ''
      vulkan_drivers: freedreno
      enable_libunwind: 'false'
  - target_arch == "ppc64le":
      gallium_drivers: nouveau,r600,r300,radeonsi,swrast,virgl
      dri_drivers: r100,r200,nouveau
      vulkan_drivers: amd
      enable_libunwind: 'false'

  optimize-debug: "false"

  meson-local: >-
    -Db_ndebug=true
    -Ddri3=enabled
    -Ddri-drivers=%{dri_drivers}
    -Degl=true
    -Dgallium-drivers=%{gallium_drivers}
    -Dgallium-nine=true
    -Dgallium-omx=disabled
    -Dgallium-opencl=icd
    -Dgallium-va=enabled
    -Dgallium-vdpau=enabled
    -Dgallium-xa=disabled
    -Dgallium-xvmc=disabled
    -Dgbm=enabled
    -Dgles1=disabled
    -Dgles2=enabled
    -Dglvnd=true
    -Dglx=auto
    -Dlibunwind=%{enable_libunwind}
    -Dllvm=enabled
    -Dlmsensors=disabled
    -Dosmesa=none
    -Dplatforms=x11,wayland
    -Dselinux=false
    -Dshared-glapi=enabled
    -Dvalgrind=disabled
    -Dvulkan-overlay-layer=true
    -Dvulkan-drivers=%{vulkan_drivers}
    -Dvulkan-icd-dir="%{libdir}/vulkan/icd.d"
    -Dxlib-lease=enabled
    -Dprefer-iris=false

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

    - |
      if [ -f "%{install-root}%{includedir}/vulkan/vulkan_intel.h" ]; then
        mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/vulkan"
        mv "%{install-root}%{includedir}/vulkan/vulkan_intel.h" "%{install-root}%{includedir}/%{gcc_triplet}/vulkan/"
      fi

    - |
      ln -sr '%{install-root}%{datadir}/glvnd' '%{install-root}%{prefix}/glvnd'
      mkdir -p '%{install-root}%{prefix}/vulkan'
      ln -sr '%{install-root}%{libdir}/vulkan/icd.d' '%{install-root}%{prefix}/vulkan/icd.d'
      ln -sr '%{install-root}%{datadir}/vulkan/explicit_layer.d' '%{install-root}%{prefix}/vulkan/explicit_layer.d'
      ln -sr '%{install-root}%{libdir}/OpenCL' '%{install-root}%{prefix}/OpenCL'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgbm.so'
        - '%{libdir}/libglapi.so'
        - '%{libdir}/libwayland-egl.so'
        - '%{libdir}/libMesaOpenCL.so'
        - '%{libdir}/d3d/d3dadapter9.so'
  cpe:
    product: mesa
    vendor: mesa3d

sources:
- kind: git_tag
  url: freedesktop:mesa/mesa.git
  track: '20.3'
  ref: mesa-20.3.3-0-g7e4d536e6308d2feb777d25f89766265cc1b183c
  exclude:
  - '*.0'
- kind: patch
  path: patches/mesa/mesa_libdrm_deps.patch
