kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/expat.bst
- filename: base/libxml2.bst
- filename: base/libffi.bst

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
- kind: tar
  url: tar_https:wayland.freedesktop.org/releases/wayland-1.15.0.tar.xz
  ref: eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf65e14488b4b7aeb0
- kind: patch
  path: patches/wayland/wayland-cursor-xdg-dirs.patch
