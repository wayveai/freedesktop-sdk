kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst
- components/gobject-introspection.bst
- components/hotdoc.bst
- components/flex.bst

depends:
- components/pipewire-daemon.bst
- components/glib.bst
- components/pygobject.bst

public:
  bst:
    integration-commands:
    - sed -i 's,^exec .*pipewire-media-session.*,exec %{bindir}/wireplumber,'  '%{sysconfdir}/pipewire/pipewire.conf'

sources:
- kind: git_tag
  url: freedesktop:PipeWire/wireplumber.git
  track: master
  ref: 0.3.0-0-g996699762c2c3576299dece52c69984a50d3e90b
- kind: git_tag
  url: github:skystrife/cpptoml.git
  directory: subprojects/cpptoml
  track: master
  ref: v0.1.1-0-gfededad7169e538ca47e11a9ee9251bc361a9a65
