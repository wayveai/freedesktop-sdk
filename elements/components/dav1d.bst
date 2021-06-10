kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/nasm.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Denable_tests=false
    -Dxxhash_muxer=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdav1d.so'

sources:
- kind: git_tag
  url: git_https:code.videolan.org/videolan/dav1d.git
  track: master
  ref: 0.9.0-0-g8636b4f2bb79ec7c2f711218ff6bcdd02a2f3f1a
