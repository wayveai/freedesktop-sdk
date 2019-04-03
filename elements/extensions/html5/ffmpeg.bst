kind: manual
description: ffmpeg shipped in the html5-codec extension, has html5 codecs enabled

(@):
- elements/config/ffmpeg.yml

variables:
  conf-extra: |
    --enable-encoder=h263,h264 \
    --enable-hwaccel=h264_vaapi,h264_vdpau \
    --enable-parser=h264 \
    --enable-demuxer=h264,mov
  ffmpeg-prefix: '%{libdir}/ffmpeg'
  ffmpeg-libdir: '%{ffmpeg-prefix}/lib'
