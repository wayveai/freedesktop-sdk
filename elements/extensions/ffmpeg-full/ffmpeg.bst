kind: manual
description: ffmpeg shipped in the ffmpeg-full extension, has more codecs enabled

(@):
- elements/include/ffmpeg.yml

variables:
  extra-aud-dec: dca,eac3,mlp,truehd
  extra-vid-enc: h263,h264
  extra-vid-dec: hevc,h263,h264,mpeg4
  extra-hwaccels: h264_vaapi,h264_vdpau,hevc_vaapi,hevc_vdpau
  extra-parsers: hevc,h264,dca,mpeg4video
  extra-demuxers: avi,h264,mov,m4v,m4a

  ffmpeg-prefix: '%{libdir}/ffmpeg'
  ffmpeg-libdir: '%{ffmpeg-prefix}/lib'
