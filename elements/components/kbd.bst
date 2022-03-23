kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

depends:
- components/linux-pam.bst
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:legionus/kbd.git
  track: master
  ref: v2.5-rc1-0-g11683bfae542fc14f012960a58a5b9b36617af37
