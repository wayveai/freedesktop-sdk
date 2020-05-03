kind: meson

# This element is not be used directly. Use either:
#  - components/pipewire.bst
#  - components/pipewire-daemon.bst

build-depends:
- bootstrap-import.bst
- components/alsa-lib.bst
- components/bluez.bst
- components/dbus.bst
- components/ffmpeg.bst
- components/gstreamer-plugins-base.bst
- components/gtk-doc.bst
- components/jack.bst
- components/sbc.bst
- components/sdl2.bst
- components/systemd-libs.bst
- components/systemd.bst
- components/vulkan.bst
- components/xmltoman.bst
- public-stacks/buildsystem-meson.bst

variables:
  # Docs depend on doxygen
  meson-local: >-
    -Ddocs=false
    -Dman=true
    -Dgstreamer=true
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
      - '%{debugdir}%{bindir}/pipewire.debug'

      jack:
      - '%{libdir}/libjack-pw.so*'
      - '%{debugdir}%{libdir}/libjack-pw.so*.debug'

      pulse:
      - '%{libdir}/libpulse-pw.so*'
      - '%{libdir}/libpulse-simple-pw.so*'
      - '%{libdir}/libpulse-mainloop-glib-pw.so*'
      - '%{debugdir}%{libdir}/libpulse-pw.so*.debug'
      - '%{debugdir}%{libdir}/libpulse-simple-pw.so*.debug'
      - '%{debugdir}%{libdir}/libpulse-mainloop-glib-pw.so*.debug'
  cpe:
    product: pipewire

sources:
- kind: git_tag
  url: github:PipeWire/pipewire.git
  track: master
  exclude:
  - '*.*.9*'
  ref: 0.3.1-0-g74a1632f0720886d5b3b6c23ee8fcd6c03ca7aac
