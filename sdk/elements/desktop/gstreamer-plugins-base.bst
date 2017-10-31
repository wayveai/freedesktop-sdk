kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst

variables:
  conf-extra: |
      --enable-experimental \
      --enable-orc

sources:
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.12.3.tar.xz
    ref: d3d37b8489d37fa0018973d850bd2067b98af335fef2fa543ee7d40359e3cea5
