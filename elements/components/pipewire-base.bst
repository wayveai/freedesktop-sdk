kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/alsa-lib.bst
- filename: components/dbus.bst
- filename: components/sdl2.bst
- filename: components/ffmpeg.bst
- filename: components/systemd.bst
  type: build
- filename: components/systemd-libs.bst
  type: runtime
- filename: components/gtk-doc.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  # Docs depend on doxygen
  # Man pages depend on xmltoman
  meson-local: >-
    -Ddocs=false
    -Dman=false
    -Dgstreamer=enabled
    -Dsystemd=true


public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipewire-*.so'
      daemon:
      - '%{sysconfdir}'
      - '%{sysconfdir}/**'
      - '%{bindir}/pipewire'
      - '%{indep-libdir}/systemd'
      - '%{indep-libdir}/systemd/**'

  cpe:
    product: pipewire

sources:
- kind: git_tag
  url: github:PipeWire/pipewire.git
  track: master
  ref: 0.2.7-0-g14c11c0fe4d366bad4cfecdee97b6652ff9ed63d
