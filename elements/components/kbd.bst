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
  ref: v2.2.0-0-g9bc99b2b9b9546e7647bdc1125658dfb2c664975
