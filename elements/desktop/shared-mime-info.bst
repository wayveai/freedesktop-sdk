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
  url: tar_https:gitlab.freedesktop.org/xdg/shared-mime-info/uploads/80c7f1afbcad2769f38aeb9ba6317a51/shared-mime-info-1.12.tar.xz
  ref: 18b2f0fe07ed0d6f81951a5fd5ece44de9c8aeb4dc5bb20d4f595f6cc6bd403e
