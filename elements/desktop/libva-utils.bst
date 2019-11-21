kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/libva.bst
- filename: base/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Ddrm=true \
    -Dwayland=true \
    -Dx11=true

sources:
- kind: git_tag
  url: github:intel/libva-utils.git
  track: v2.4-branch
  ref: 2.4.0-0-gbb6a0bd6fe5c3f151ffc4c0d09c81a1ef9479b63
