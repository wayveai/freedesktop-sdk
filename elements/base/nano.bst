kind: autotools
description: GNU nano

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

sources:
- kind: tar
  url: tar_https:www.nano-editor.org/dist/v2.9/nano-2.9.8.tar.xz
  ref: c2deac31ba4d3fd27a42fafcc47ccf499296cc69a422bbecab63f2933ea85488
