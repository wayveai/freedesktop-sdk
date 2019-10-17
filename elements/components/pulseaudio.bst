kind: filter

build-depends:
- components/pulseaudio-base.bst

runtime-depends:
- components/libpulse.bst

config:
  exclude:
  - libpulse
  include-orphans: True
