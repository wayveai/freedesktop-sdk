kind: manual

depends:
  - filename: base.bst
    type: build
  - filename: desktop/fontconfig.bst
  - filename: desktop/freetype.bst
  - filename: desktop/mesa.bst
  - filename: desktop/mpg123.bst
  - filename: desktop/openal.bst
  - filename: desktop/pulseaudio.bst
  - filename: desktop/sdl2.bst

variables:
  ffmpeg-arch: "%{arch}"
  (?):
    - target_arch == "i586":
        ffmpeg-arch: x86
  conf-local: |
    --disable-debug \
    --disable-doc \
    --disable-static \
    --enable-gpl \
    --enable-optimizations \
    --enable-libvpx \
    --enable-shared \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-everything \
    --enable-gnutls \
    --enable-libfontconfig \
    --enable-libfreetype \
    --enable-libopus \
    --enable-libpulse \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-openal \
    --enable-opengl \
    --enable-sdl2 \
    --enable-decoder=pcm_s16be,pcm_s24be,pcm_mulaw,pcm_alaw \
    --enable-decoder=pcm_u8,pcm_s16le,pcm_s24le,pcm_f32le \
    --enable-decoder=theora,vorbis,vp8,vp9,mp3,flac,webp \
    --enable-decoder=rawvideo,png,gif \
    --enable-parser=opus,vp3,vorbis,vp8,mpegaudio,flac \
    --enable-demuxer=ogg,matroska,wav,mp3,gif,flac \
    --enable-filter=crop,scale \
    --enable-protocol=file \
    --arch=%{ffmpeg-arch}

sources:
- kind: git
  url: https://github.com/FFmpeg/FFmpeg.git
  track: release/3.4
  ref: bc839fb39dc376d462856863de2933f0b6b0351a # n3.4.1

# ffmpeg is not using autotools, but a configure and Makefile files
config:
  configure-commands:
    - ./configure %{conf-local}

  build-commands:
    - make

  install-commands:
    - make -j1 DESTDIR="%{install-root}" install
