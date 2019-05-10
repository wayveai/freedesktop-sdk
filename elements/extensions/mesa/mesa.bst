kind: filter

depends:
- filename: extensions/mesa/mesa-base.bst
  type: build

- filename: bootstrap-import.bst
  type: runtime
- filename: components/libdrm.bst
  type: runtime
- filename: extensions/mesa/libdrm.bst
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
- filename: extensions/mesa/gbm.bst
  type: runtime

config:
  exclude:
  - gbm
  include-orphans: True

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/default"
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
