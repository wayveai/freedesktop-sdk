kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libcap.bst

sources:
- kind: git_tag
  url: github:projectatomic/bubblewrap.git
  track: main
  ref: v0.5.0-0-gb84704bb64eac3011f84346c79651c7c1234712c
