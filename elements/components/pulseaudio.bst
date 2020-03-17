kind: filter

build-depends:
- components/pulseaudio-base.bst

runtime-depends:
- components/libpulse.bst
- components/bluez.bst
- components/sbc.bst
- components/alsa-lib.bst

config:
  exclude:
  - libpulse
  include-orphans: True
