kind: meson

(@): elements/extensions/include/app.yml

depends:
- filename: bootstrap-import.bst
- filename: components/libva.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Ddrm=true \
    -Dwayland=true \
    -Dx11=true

sources:
- kind: git_tag
  url: github:intel/libva-utils.git
  track: v2.5-branch
  ref: 2.5.0-0-ga04ba9224fc80a8f60757fbe99b190d62123608c
