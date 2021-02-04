kind: meson

(@): elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/libva.bst

variables:
  meson-local: |
    -Ddrm=true \
    -Dwayland=true \
    -Dx11=true

sources:
- kind: git_tag
  url: github:intel/libva-utils.git
  track: v2.9-branch
  ref: 2.9.1-0-g50c7f19d65e2535940e31c6711352b36d6d64fd7
