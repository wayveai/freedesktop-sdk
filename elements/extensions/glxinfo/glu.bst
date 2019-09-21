kind: autotools

(@): elements/extensions/include/app.yml

depends:
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/mesa-headers.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:mesa/glu.git
  track: master
  ref: glu-9.0.1-0-gdd4e18eb7557a31a3c8318d6612801329877c745
