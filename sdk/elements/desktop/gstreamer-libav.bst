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
    ref: 1830c75cd28fc68bd26f9530db18c2da474a4aa2 #  1.14.0
    submodules:
      common:
        url: freedesktop:gstreamer/common
      gst-libs/ext/libav:
        url: https://git.ffmpeg.org/ffmpeg.git
      gst-libs/ext/gas-preprocessor:
        url: git://git.libav.org/gas-preprocessor.git
