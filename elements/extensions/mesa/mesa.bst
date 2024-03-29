kind: meson

build-depends:
- components/bison.bst
- components/m4.bst
- components/appstream-glib.bst
- components/flex.bst
- components/llvm.bst
- components/python3.bst
- components/python3-mako.bst
- components/vulkan-headers.bst
- components/wayland-protocols.bst
- components/glslang.bst
- components/zstd.bst
- public-stacks/buildsystem-meson.bst


depends:
- bootstrap-import.bst
- components/libdrm.bst
- components/libva.bst
- components/opencl.bst
- components/xorg-lib-xfixes.bst
- components/xorg-lib-xrandr.bst
- components/xorg-lib-xshmfence.bst
- components/xorg-lib-xxf86vm.bst
- components/vulkan-icd-loader.bst
- components/wayland.bst
- components/libglvnd.bst
- components/libvdpau.bst
- components/libunwind-maybe.bst
- extensions/mesa/libclc.bst
- extensions/mesa/libdrm.bst
- extensions/mesa/llvm.bst


(@):
- elements/extensions/mesa/config.yml

environment:
  PKG_CONFIG_PATH: "%{libdir}/pkgconfig:%{datadir}/pkgconfig"
  CXXFLAGS: "%{target_flags} -std=gnu++17"

variables:
  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      gallium_drivers: iris,crocus,nouveau,r300,r600,radeonsi,svga,swrast,virgl,zink
      dri_drivers: i915,i965,nouveau,r100,r200
      vulkan_drivers: amd,intel,swrast,virtio-experimental
      enable_libunwind: 'true'
  - target_arch == "arm" or target_arch == "aarch64":
      gallium_drivers: asahi,etnaviv,freedreno,kmsro,lima,nouveau,panfrost,swrast,tegra,virgl,v3d,vc4,zink
      dri_drivers: ''
      vulkan_drivers: freedreno,broadcom,panfrost,swrast
      enable_libunwind: 'false'
  - target_arch == "ppc64le" or target_arch == "riscv64":
      gallium_drivers: nouveau,r600,r300,radeonsi,swrast,virgl
      dri_drivers: r100,r200,nouveau
      vulkan_drivers: amd
      enable_libunwind: 'false'

  optimize-debug: "false"

  meson-local: >-
    -Db_ndebug=true
    -Ddri3=enabled
    -Ddri-drivers=%{dri_drivers}
    -Degl=enabled
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
    -Dmicrosoft-clc=disabled
    -Dosmesa=false
    -Dplatforms=x11,wayland
    -Dprefer-crocus=true
    -Dselinux=false
    -Dshared-glapi=enabled
    -Dvalgrind=disabled
    -Dvulkan-layers=device-select,overlay
    -Dvulkan-drivers=%{vulkan_drivers}
    -Dvulkan-icd-dir="%{libdir}/vulkan/icd.d"
    -Dxlib-lease=enabled
    -Dzstd=enabled

  app-id: >-
    org.freedesktop.Platform.GL.default
    org.freedesktop.Platform.GL32.default

config:
  install-commands:
    (>):
    - |
      set -e
      appdata_dir=%{install-root}%{datadir}/appdata
      mkdir -p ${appdata_dir}
      CURRENT_REF=$(git describe --match mesa-*)
      TIMESTAMP=$(git log -1 --format="%at" ${CURRENT_REF})
      VERSION_DATE=$(date -d @"$TIMESTAMP" -Idate)
      for app_id in %{app-id}
      do
        m4 -D__VERSION__=${CURRENT_REF} -D__VERSION_DATE__=${VERSION_DATE} \
        -D__APP_ID__=${app_id} \
        appdata.template > ${appdata_dir}/${app_id}.appdata.xml
        appstream-compose --basename ${app_id} \
        --prefix=%{install-root}%{prefix} --origin=flatpak ${app_id}
      done

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
      ln -sr '%{install-root}%{datadir}/vulkan/implicit_layer.d' '%{install-root}%{prefix}/vulkan/implicit_layer.d'
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
  track: main
  track-extra:
  - '21.3'
  exclude:
  - '*rc*'
  ref: mesa-21.3.8-0-g813ee839be2ce7c3c804dc90cba5678323bcad7c
- kind: local
  path: files/mesa/appdata.template
- kind: patch
  path: patches/mesa/mesa_libdrm_deps.patch
- kind: patch
  path: patches/mesa/mesa-cle-build-fix.patch
