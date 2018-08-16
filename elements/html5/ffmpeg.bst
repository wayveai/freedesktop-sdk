kind: manual

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/fontconfig.bst
  - filename: desktop/freetype.bst
  - filename: desktop/libfdk-aac.bst
  - filename: desktop/lame.bst
  - filename: desktop/mesa.bst
  - filename: desktop/mpg123.bst
  - filename: desktop/openal.bst
  - filename: desktop/libpulse.bst
  - filename: desktop/sdl2.bst
  - filename: base/gnutls.bst
  - filename: base/speex.bst
  - filename: base/libtheora.bst
  - filename: base/libvorbis.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/nasm.bst
    type: build

variables:
  ffmpeg-arch: "%{arch}"
  (?):
    - target_arch == "i586":
        ffmpeg-arch: x86
  (@):
    - elements/config/ffmpeg-config.yml

  conf-extra: |
    --arch=%{ffmpeg-arch} \
    --enable-encoder=h263,h264 \
    --enable-hwaccel=h264_vaapi,h264_vdpau \
    --enable-parser=h264 \
    --enable-demuxer=h264,mov

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/ffmpeg/lib/libavdevice.so"
          - "%{libdir}/ffmpeg/lib/libavcodec.so"
          - "%{libdir}/ffmpeg/lib/libswscale.so"
          - "%{libdir}/ffmpeg/lib/libpostproc.so"
          - "%{libdir}/ffmpeg/lib/libavutil.so"
          - "%{libdir}/ffmpeg/lib/libavfilter.so"
          - "%{libdir}/ffmpeg/lib/libavformat.so"
          - "%{libdir}/ffmpeg/lib/libswresample.so"

# ffmpeg is not using autotools, but a configure and Makefile files
config:
  configure-commands:
    - ./configure %{conf-local} %{conf-extra}

  build-commands:
    - make

  install-commands:
    - |
      make -j1 DESTDIR="%{install-root}" install

    - |
      rm -rf "%{install-root}%{libdir}/ffmpeg/bin" \
             "%{install-root}%{libdir}/ffmpeg/share" \
             "%{install-root}%{libdir}/ffmpeg/include" \
             "%{install-root}%{libdir}/ffmpeg/lib/pkgconfig"

sources:
- kind: git
  url: https://git.ffmpeg.org/ffmpeg.git
  track: n4.0.2
  # We build ffmpeg in the main SDK too, if you update
  # this ref, please update the main one too.
  ref: 0a155c57bd8eb92ccaf7f5857dc6ab276d235846 # n4.0.2
