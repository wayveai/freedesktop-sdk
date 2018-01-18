kind: meson

depends:
  - filename: base.bst
    type: build
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst

variables:
  meson-local: |
    -Duse_orc=yes

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgstfft-1.0.so"
          - "%{libdir}/libgstrtp-1.0.so"
          - "%{libdir}/libgstsdp-1.0.so"
          - "%{libdir}/libgstvideo-1.0.so"
          - "%{libdir}/libgstapp-1.0.so"
          - "%{libdir}/libgstriff-1.0.so"
          - "%{libdir}/libgstrtsp-1.0.so"
          - "%{libdir}/libgstallocators-1.0.so"
          - "%{libdir}/libgsttag-1.0.so"
          - "%{libdir}/libgstaudio-1.0.so"
          - "%{libdir}/libgstpbutils-1.0.so"

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-base
    track: 1.12
    ref: e07c69f65598068b380753066783a1c67e3d4464  # 1.12.14
