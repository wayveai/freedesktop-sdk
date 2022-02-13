kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Ddistro_install=true

sources:
- kind: git_tag
  url: github:benhoyt/inih.git
  track: master
  ref: r53-0-gcb55f57d87ae840bd0f65dbe6bd22fa021a873a7
