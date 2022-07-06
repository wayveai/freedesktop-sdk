kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/gnu-efi.bst

sources:
- kind: git_tag
  url: github:fwupd/fwupd-efi.git
  track: main
  ref: 1.3-0-g36ce593f58e391cca43fd388824496ff98d83480
