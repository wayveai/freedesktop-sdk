kind: make
description: Base ffmpeg we ship in the SDK, no patented codecs

(@):
- elements/include/ffmpeg.yml

depends:
  (>):
  - components/noopenh264.bst

variables:
  extra-vid-enc: libopenh264
  extra-vid-dec: libopenh264
  conf-extra: --enable-libopenh264
