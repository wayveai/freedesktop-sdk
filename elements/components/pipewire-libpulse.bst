kind: filter
description: |
  This element replaces Pulseaudio library by a drop-in replacement so that
  Pulsaudio clients connects to Pipewire.
  This is not to be confused with the Pulseaudio plugin for Pipewire.

build-depends:
- components/pipewire-base.bst

runtime-depends:
- components/pipewire-daemon.bst

config:
  include:
  - libpulse
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/pipewire-0.3/pulse/libpulse.so'
        - '%{libdir}/pipewire-0.3/pulse/libpulse-simple.so'
        - '%{libdir}/pipewire-0.3/pulse/libpulse-mainloop-glib.so'

    integration-commands:
    - rm -f "%{libdir}/libpulse.so*"
    - rm -f "%{libdir}/libpulse-simple.so*"
    - rm -f "%{libdir}/libpulse-mainloop-glib.so*"
    - ln -sf pipewire-0.3/pulse/libpulse.so.0 "%{libdir}/libpulse.so.0"
    - ln -sf pipewire-0.3/pulse/libpulse-simple.so.0 "%{libdir}/libpulse-simple.so.0"
    - ln -sf pipewire-0.3/pulse/libpulse-mainloop-glib.so.0 "%{libdir}/libpulse-mainloop-glib.so.0"
