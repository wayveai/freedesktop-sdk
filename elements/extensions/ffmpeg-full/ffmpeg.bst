kind: manual
description: ffmpeg shipped in the ffmpeg-full extension, has more codecs enabled

(@):
- elements/include/ffmpeg.yml

variables:
  conf-extra: |
    --enable-encoder=h263,h264 \
    --enable-decoder=aac,hevc,h264,h263,ac3,eac3,truehd,mlp,dca,mpeg4 \
    --enable-hwaccel=h264_vaapi,h264_vdpau,hevc_vaapi,hevc_vdpau \
    --enable-parser=aac,hevc,h264,ac3,dca,mpeg4video \
    --enable-demuxer=avi,aac,h264,mov,ac3,m4v,m4a
  ffmpeg-prefix: '%{libdir}/ffmpeg'
  ffmpeg-libdir: '%{ffmpeg-prefix}/lib'
