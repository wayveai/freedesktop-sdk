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
        - '%{libdir}/libpulse-pw.so'
        - '%{libdir}/libpulse-simple-pw.so'
        - '%{libdir}/libpulse-mainloop-glib-pw.so'

    integration-commands:
    - rm "%{libdir}"/libpulse.so*
    - rm "%{libdir}"/libpulse-simple.so*
    - rm "%{libdir}"/libpulse-mainloop-glib.so*
    - ln -sf libpulse-pw.so.0.3.1 "%{libdir}/libpulse.so.0"
    - ln -sf libpulse-simple-pw.so.0.3.1 "%{libdir}/libpulse-simple.so.0"
    - ln -sf libpulse-mainloop-glib-pw.so.0.3.1 "%{libdir}/libpulse-mainloop-glib.so.0"
