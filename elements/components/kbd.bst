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
  ref: v2.5.1-0-g478b7cafa5f8d38108dc5a61f8afcd0891846372
