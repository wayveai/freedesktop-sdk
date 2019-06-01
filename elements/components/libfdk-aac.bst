kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfdk-aac.so'

sources:
- kind: git_tag
  url: git://people.freedesktop.org/~wtay/fdk-aac
  track: fedora
  ref: 455feca42c8e1576fbc836f5b613295847a670ed
