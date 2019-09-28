kind: manual
description: ffmpeg shipped in the ffmpeg-full extension, has more codecs enabled

(@):
- elements/include/ffmpeg.yml

variables:
  extra-aud-enc: wmav1,wmav2
  extra-aud-dec: ape,dca,eac3,mlp,tak,truehd,wmav1,wmav2,wmapro
  extra-vid-enc: h263,h264,wmv1,wmv2
  extra-vid-dec: hevc,h263,h264,mpeg4,wmv1,wmv2,wmv3,wmv3image
  extra-hwaccels: h264_vaapi,h264_vdpau,hevc_vaapi,hevc_vdpau
  extra-parsers: hevc,h264,dca
  extra-demuxers: avi,h264,m4v

  ffmpeg-prefix: '%{libdir}/ffmpeg'
  ffmpeg-libdir: '%{ffmpeg-prefix}/lib'
