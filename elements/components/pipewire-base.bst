kind: meson

# This element is not be used directly. Use either:
#  - components/pipewire.bst
#  - components/pipewire-daemon.bst

build-depends:
- bootstrap-import.bst
- components/alsa-lib.bst
- components/avahi.bst
- components/bluez.bst
- components/dbus.bst
- components/ffmpeg.bst
- components/gstreamer-plugins-base.bst
- components/gtk-doc.bst
- components/libusb.bst
- components/python3-docutils.bst
- components/rtkit.bst
- components/sbc.bst
- components/sdl2.bst
- components/systemd-libs.bst
- components/systemd.bst
- components/vulkan-headers.bst
- components/doxygen.bst
- components/webrtc-audio-processing.bst
- public-stacks/buildsystem-meson.bst

variables:
  meson-local: >-
    -Daudiotestsrc=disabled
    -Djack=disabled
    -Droc=disabled
    -Dvideotestsrc=disabled
    -Dvolume=disabled
    -Dvulkan=disabled
    -Ddocs=enabled
    -Dman=enabled
    -Dbluez5-codec-ldac=disabled
    -Dbluez5-codec-aptx=disabled
    -Dlibcamera=disabled
    -Dlibcanberra=disabled
    -Dlv2=disabled
    -Dlibjack-path=%{libdir}
    -Dudevrulesdir=$(pkg-config --variable=udevdir udev)/rules.d

public:
  bst:
    split-rules:
      daemon:
      - '%{bindir}/pipewire*'
      - '%{libdir}/libjackserver.so*'
      - '%{libdir}/spa-0.2/alsa'
      - '%{libdir}/spa-0.2/alsa/**'
      - '%{libdir}/spa-0.2/bluez5'
      - '%{libdir}/spa-0.2/bluez5/**'
      - '%{libdir}/spa-0.2/v4l2'
      - '%{libdir}/spa-0.2/v4l2/**'
      - '%{libdir}/pipewire-0.3/libpipewire-module-access.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-echo-cancel.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-filter-chain.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-link-factory.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-portal.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-profiler.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-protocol-pulse.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-protocol-simple.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-pulse-tunnel.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-rt.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-device.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-node-factory.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-node.so'
      - '%{libdir}/pipewire-0.3/libpipewire-module-zeroconf-discover.so'
      - '%{sysconfdir}/pipewire/media-session.d'
      - '%{sysconfdir}/pipewire/media-session.d/**'
      - '%{sysconfdir}/pipewire/pipewire*'
      - '%{datadir}/alsa'
      - '%{datadir}/alsa/**'
      - '%{datadir}/alsa-card-profile'
      - '%{datadir}/alsa-card-profile/**'
      - '%{indep-libdir}/systemd'
      - '%{indep-libdir}/systemd/**'
      - '%{indep-libdir}/udev'
      - '%{indep-libdir}/udev/**'
      - '%{debugdir}%{bindir}/pipewire*.debug'
      - '%{debugdir}%{libdir}/libjackserver.so*'
      - '%{libdir}/spa-0.2/alsa'
      - '%{libdir}/spa-0.2/alsa/**'
      - '%{libdir}/spa-0.2/bluez5'
      - '%{libdir}/spa-0.2/bluez5/**'
      - '%{libdir}/spa-0.2/v4l2'
      - '%{libdir}/spa-0.2/v4l2/**'
      - '%{libdir}/pipewire-0.3/libpipewire-module-access.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-echo-cancel.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-filter-chain.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-link-factory.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-portal.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-profiler.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-protocol-pulse.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-protocol-simple.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-pulse-tunnel.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-rt.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-device.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-node-factory.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-spa-node.so.debug'
      - '%{libdir}/pipewire-0.3/libpipewire-module-zeroconf-discover.so.debug'

  cpe:
    product: pipewire

sources:
- kind: git_tag
  url: freedesktop:PipeWire/pipewire.git
  track: master
  exclude:
  - '*.*.9*'
  ref: 0.3.45-0-gbdd407fe66cc9e46d4bc4dcc989d50679000482b
- kind: patch
  path: patches/pipewire/remove-useless-rpaths.patch
- kind: git_tag
  url: freedesktop:PipeWire/media-session.git
  directory: subprojects/media-session
  track: master
  track-tags: false
  ref: 0.4.1-10-gf71506321393a0f85f6da0427cd99efa99f2d1e2
