kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/intltool.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/libxml2.bst
- filename: base/glib.bst

variables:
  notparallel: true

sources:
- kind: tar
  url: https://freedesktop.org/~hadess/shared-mime-info-1.10.tar.xz
  ref: c625a83b4838befc8cafcd54e3619946515d9e44d63d61c4adf7f5513ddfbebf
