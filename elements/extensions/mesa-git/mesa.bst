kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/glslang.bst
- filename: components/llvm.bst
- filename: components/libdrm.bst
- filename: extensions/mesa-git/libdrm.bst
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

environment:
  PKG_CONFIG_PATH: "%{libdir}/pkgconfig:"
  CXXFLAGS:  "%{target_flags} -std=gnu++17"

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/mesa-git"
  lib: "lib"
  debugdir: "/usr/lib/debug"

  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      gallium_drivers: iris,nouveau,r300,r600,radeonsi,svga,swrast,virgl
      dri_drivers: i915,i965,nouveau,r100,r200
      vulkan_drivers: amd,intel
      enable_libunwind: 'true'
  - target_arch == "arm" or target_arch == "aarch64":
      gallium_drivers: etnaviv,freedreno,kmsro,lima,nouveau,panfrost,swrast,tegra,virgl,v3d,vc4
      dri_drivers: ''
      vulkan_drivers: ''
      enable_libunwind: 'false'
  - target_arch == "powerpc64le":
      gallium_drivers: nouveau,r600,r300,radeonsi,swrast,virgl
      dri_drivers: r100,r200,nouveau
      vulkan_drivers: amd
      enable_libunwind: 'false'

  optimize-debug: "false"

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
    -Dgallium-xa=false \
    -Dgallium-xvmc=false \
    -Dgbm=true \
    -Dgles1=false \
    -Dgles2=true \
    -Dglvnd=true \
    -Dglx=auto \
    -Dlibunwind=%{enable_libunwind} \
    -Dllvm=true \
    -Dlmsensors=false \
    -Dosmesa=none \
    -Dplatforms=x11,drm,surfaceless,wayland \
    -Dselinux=false \
    -Dshared-glapi=true \
    -Dvalgrind=false \
    -Dvulkan-overlay-layer=true \
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

sources:
- kind: git_tag
  url: freedesktop:mesa/mesa.git
  track: master
  track-tags: false
  ref: 19.3-branchpoint-2509-g951083768b351b0700bdcc02758670e505cce974
- kind: patch
  path: patches/mesa/mesa_libdrm_deps.patch
