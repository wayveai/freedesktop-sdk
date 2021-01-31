kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/expat.bst
- filename: components/libxml2.bst
- filename: components/libffi.bst

variables:
  conf-local: |
    --disable-documentation

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/wayland-scanner'
        - '%{libdir}/libwayland-client.so'
        - '%{libdir}/libwayland-cursor.so'
        - '%{libdir}/libwayland-egl.so'
        - '%{libdir}/libwayland-server.so'

sources:
- kind: git_tag
  url: freedesktop:wayland/wayland.git
  track: master
  exclude:
  - '*.*.9*'
  ref: 1.19.0-0-ge60398b1755bfcdf09f040d3769131fe0d9762fc
- kind: patch
  path: patches/wayland/wayland-cursor-xdg-dirs.patch
