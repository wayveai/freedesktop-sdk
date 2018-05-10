kind: meson

depends:
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/mesa.bst
  - filename: base/meson.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

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
          - "%{libdir}/libgstgl-1.0.so"

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-plugins-base
    track: 1.14
    ref: 46fc41f1a8378639f2982b777035bbcddd4e5000 # 1.14.0
