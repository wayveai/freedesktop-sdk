kind: meson

# This element is not be used directly. Use either:
#  - components/pipewire.bst
#  - components/pipewire-daemon.bst

build-depends:
- bootstrap-import.bst
- components/gstreamer-plugins-base.bst
- components/alsa-lib.bst
- components/dbus.bst
- components/sdl2.bst
- components/ffmpeg.bst
- components/systemd.bst
- components/systemd-libs.bst
- components/gtk-doc.bst
- public-stacks/buildsystem-meson.bst

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
