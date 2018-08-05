kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/autoconf-archive.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
    --with-system-libav

sources:
  - kind: git
    url: freedesktop:gstreamer/gst-libav
    track: 1.14
    ref: 8886a016fce625e1c25a4902be4021196a6784a2 #  1.14.2
    submodules:
      common:
        url: freedesktop:gstreamer/common
      gst-libs/ext/libav:
        url: https://git.ffmpeg.org/ffmpeg.git
      gst-libs/ext/gas-preprocessor:
        url: git://git.libav.org/gas-preprocessor.git
