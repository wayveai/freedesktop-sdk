kind: manual
description: ffmpeg shipped in the ffmpeg-html5 extension, has html5 codecs enabled

(@):
- elements/include/ffmpeg.yml

variables:
  extra-vid-enc: h263,h264
  extra-hwaccels: h264_vaapi,h264_vdpau
  extra-parsers: h264
  extra-demuxers: h264,mov

  ffmpeg-prefix: '%{libdir}/ffmpeg'
  ffmpeg-libdir: '%{ffmpeg-prefix}/lib'
