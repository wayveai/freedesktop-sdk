kind: myautotools

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst

variables:
  conf-extra: |
      --enable-experimental \
      --enable-orc

public:
  bst:
    split-rules:
      devel:
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
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.3.tar.xz
    ref: d3d37b8489d37fa0018973d850bd2067b98af335fef2fa543ee7d40359e3cea5
