kind: meson

# This element is not be used directly. Use either:
#  - components/pipewire.bst
#  - components/pipewire-daemon.bst
#  - components/pipewire-libjack.bst
#  - components/pipewire-libpulse.bst

build-depends:
- bootstrap-import.bst
- components/alsa-lib.bst
- components/bluez.bst
- components/dbus.bst
- components/ffmpeg.bst
- components/gstreamer-plugins-base.bst
- components/gtk-doc.bst
- components/jack.bst
- components/rtkit.bst
- components/sbc.bst
- components/sdl2.bst
- components/systemd-libs.bst
- components/systemd.bst
- components/vulkan.bst
- components/xmltoman.bst
- components/doxygen.bst
- public-stacks/buildsystem-meson.bst

variables:
  meson-local: >-
    -Ddocs=true
    -Dman=true
    -Dgstreamer=true
    -Dsystemd=true
    -Dudevrulesdir=$(pkg-config --variable=udevdir udev)/rules.d

public:
  bst:
    split-rules:
      daemon:
      - '%{sysconfdir}'
      - '%{sysconfdir}/**'
      - '%{bindir}/pipewire'
      - '%{indep-libdir}/systemd'
      - '%{indep-libdir}/systemd/**'
      - '%{indep-libdir}/udev/**'
      - '%{debugdir}%{bindir}/pipewire.debug'

      libjack:
      - '%{libdir}/pipewire-0.3/jack/**'
      - '%{debugdir}%{libdir}/pipewire-0.3/jack/**'

      libpulse:
      - '%{libdir}/pipewire-0.3/pulse/**'
      - '%{debugdir}%{libdir}/pipewire-0.3/pulse/**'
  cpe:
    product: pipewire

sources:
- kind: git_tag
  url: github:PipeWire/pipewire.git
  track: master
  exclude:
  - '*.*.9*'
  ref: 0.3.8-0-g229fad46914a32b621e88e53abd1270c62b0e158
- kind: patch
  path: patches/pipewire/remove-useless-rpaths.patch
