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
  track: master
  ref: libnl3_5_0-0-g7b167ef85f6eb4d7faca349302478b2dc121e309
