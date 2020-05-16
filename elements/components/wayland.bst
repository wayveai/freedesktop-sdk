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
  ref: 1.18.0-0-geb1339edd398b9f5328816931e585db4229aa132
- kind: patch
  path: patches/wayland/wayland-cursor-xdg-dirs.patch
