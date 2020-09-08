kind: stack
description: |
  This element replaces Pulseaudio library by a drop-in replacement so that
  Pulsaudio clients connects to Pipewire.
  This is not to be confused with the Pulseaudio plugin for Pipewire.

runtime-depends:
- components/pipewire-libpulse-manual.bst

public:
  bst:
    integration-commands:
    - rm -f "%{libdir}"/libpulse.so*
    - rm -f "%{libdir}"/libpulse-simple.so*
    - rm -f "%{libdir}"/libpulse-mainloop-glib.so*
    - ln -sf pipewire-0.3/pulse/libpulse.so.0 "%{libdir}/libpulse.so.0"
    - ln -sf pipewire-0.3/pulse/libpulse-simple.so.0 "%{libdir}/libpulse-simple.so.0"
    - ln -sf pipewire-0.3/pulse/libpulse-mainloop-glib.so.0 "%{libdir}/libpulse-mainloop-glib.so.0"
