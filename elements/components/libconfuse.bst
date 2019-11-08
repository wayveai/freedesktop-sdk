kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst

sources:
- kind: git_tag
  url: github:martinh/libconfuse.git
  track: master
  ref: v3.2.2-0-g8dc469dcce4d19379caff2d2cbf68f38af034210
