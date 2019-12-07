kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xkbfile.bst
- filename: base/buildsystem-autotools.bst
  type: build

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/app/xkbcomp-1.4.2.tar.bz2
  ref: 6dd8bcb9be7e85bd7294abe261b8c7b0539d2fc93e41b80fb8bd013767ce8424
