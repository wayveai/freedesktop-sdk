kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst

variables:
  conf-extra: |
      --disable-asfdemux \
      --disable-dvdlpcmdec \
      --disable-dvdsub \
      --disable-xingmux \
      --disable-realmedia

sources:
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.3.tar.xz
    ref: e88ca584c94ea78eeecbf3af00ef7f134b66bdee7408aa4aa6c547235e060052
