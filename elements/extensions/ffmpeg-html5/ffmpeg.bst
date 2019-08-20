kind: manual
description: ffmpeg shipped in the ffmpeg-html5 extension, has html5 codecs enabled

(@):
- elements/include/ffmpeg.yml

variables:
  conf-extra: |
    --enable-encoder=h263,h264 \
    --enable-hwaccel=h264_vaapi,h264_vdpau \
    --enable-parser=h264 \
    --enable-demuxer=h264,mov
  ffmpeg-prefix: '%{libdir}/ffmpeg'
  ffmpeg-libdir: '%{ffmpeg-prefix}/lib'
