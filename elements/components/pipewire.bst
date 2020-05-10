kind: filter

build-depends:
- components/pipewire-base.bst

runtime-depends:
- bootstrap-import.bst
- components/gstreamer-plugins-base.bst
- components/alsa-lib.bst
- components/dbus.bst
- components/sdl2.bst
- components/ffmpeg.bst
- components/systemd-libs.bst
- components/pipewire-manifest.bst

config:
  exclude:
  - daemon
  - libjack
  - libpulse
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipewire-*.so'
