kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcap-ng.so'

sources:
- kind: git_tag
  url: github:stevegrubb/libcap-ng.git
  track: master
  ref: v0.8.2-0-gd567fd5099ef7c157f8a1864bf77a3ae9a259232
