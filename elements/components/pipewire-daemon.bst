kind: filter

build-depends:
- components/pipewire-base.bst

runtime-depends:
- components/avahi.bst
- components/pipewire.bst
- components/sbc.bst
- components/bluez.bst
- components/bluez-libs.bst
- components/rtkit.bst
- components/webrtc-audio-processing.bst

config:
  include:
  - daemon
  include-orphans: False
