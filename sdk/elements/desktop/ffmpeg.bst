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

sources:
- kind: tar
  url: https://ffmpeg.org/releases/ffmpeg-3.4.1.tar.xz
  ref: 5a77278a63741efa74e26bf197b9bb09ac6381b9757391b922407210f0f991c0

# ffmpeg is not using autotools, but a configure and Makefile files
config:
  configure-commands:
    - ./configure %{conf-local}

  build-commands:
    - make

  install-commands:
    - make -j1 DESTDIR="%{install-root}" install
