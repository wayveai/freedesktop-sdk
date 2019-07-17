kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/orc'
        - '%{libdir}/liborc-0.4.so'
        - '%{libdir}/liborc-test-0.4.so'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/orc.git
  track: master
  ref: 0.4.29-0-g3d3889025bdbd9ca54565edfb3936c5a29316cff

