kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python3.bst
    type: build

sources:
  - kind: tar
    url: https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-3.76.tar.xz
    ref: 38ea8c1de7c07d5b4c9603ec65c238c155992a2e2ab0b02725d0926d1ad480c4
