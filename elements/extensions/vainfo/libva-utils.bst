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
  track: v2.15-branch
  track-extra:
  # Attempt to predict the next branchpoint.
  - v2.16-branch
  ref: 2.15.0-0-gbe203c8b85b07e1f7a3faedd13057b0a8cabd3c3
