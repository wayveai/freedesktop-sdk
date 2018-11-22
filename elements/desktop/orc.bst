kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/orc'
        - '%{libdir}/liborc-0.4.so'
        - '%{libdir}/liborc-test-0.4.so'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/orc
  ref: orc-0.4.28-0-g31cb4bfc51de81b5c2569abdcff830b83c74499c

