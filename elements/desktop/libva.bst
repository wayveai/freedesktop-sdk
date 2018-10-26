kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/libdrm.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: desktop/xorg-lib-xfixes.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libva.so'
        - '%{libdir}/libva-tpi.so'
        - '%{libdir}/libva-x11.so'
        - '%{libdir}/libva-drm.so'
        - '%{libdir}/libva-egl.so'
        - '%{libdir}/libva-glx.so'
        - '%{libdir}/libva-wayland.so'

sources:
- kind: tar
  url: https://github.com/intel/libva/releases/download/2.1.0/libva-2.1.0.tar.bz2
  ref: f3fa953a11d3210c3a4ee79031abdbe0863d5ce13d9b3f93f315f1eec60a4b0f
