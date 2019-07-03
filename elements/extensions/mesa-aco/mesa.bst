kind: filter

depends:
- filename: extensions/mesa-aco/mesa-base.bst
  type: build

- filename: bootstrap-import.bst
  type: runtime
- filename: components/libdrm.bst
  type: runtime
- filename: extensions/mesa-aco/libdrm.bst
  type: runtime
- filename: components/libva.bst
  type: runtime
- filename: components/libclc.bst
  type: runtime
- filename: components/opencl.bst
  type: runtime
- filename: components/xorg-lib-xdamage.bst
  type: runtime
- filename: components/xorg-lib-xfixes.bst
  type: runtime
- filename: components/xorg-lib-xrandr.bst
  type: runtime
- filename: components/xorg-lib-xshmfence.bst
  type: runtime
- filename: components/xorg-lib-xxf86vm.bst
  type: runtime
- filename: components/wayland.bst
  type: runtime
- filename: components/libglvnd.bst
  type: runtime
- filename: components/libvdpau.bst
  type: runtime
- filename: components/libunwind.bst
  type: runtime

  # gbm is required by EGL backends
- filename: extensions/mesa-aco/gbm.bst
  type: runtime

config:
  exclude:
  - gbm
  include-orphans: True

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/mesa-aco"
  lib: "lib"
  debugdir: "/usr/lib/debug"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libglapi.so'
        - '%{libdir}/libwayland-egl.so'
        - '%{libdir}/libxatracker.so'
        - '%{libdir}/libMesaOpenCL.so'
