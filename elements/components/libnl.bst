kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnl.so'

sources:
- kind: git_tag
  url: github:thom311/libnl.git
  track: main
  ref: libnl3_6_0-0-gcacaa5fd2f583e3c3fd2bc7f6439948cf056c9a2
