kind: filter

depends:
- filename: components/pipewire-base.bst
  type: build
- filename: bootstrap-import.bst
  type: runtime
- filename: components/gstreamer-plugins-base.bst
  type: runtime
- filename: components/alsa-lib.bst
  type: runtime
- filename: components/dbus.bst
  type: runtime
- filename: components/sdl2.bst
  type: runtime
- filename: components/ffmpeg.bst
  type: runtime
- filename: components/systemd-libs.bst
  type: runtime
- filename: components/pipewire-manifest.bst
  type: runtime

config:
  exclude:
  - daemon
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipewire-*.so'
