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
        - '%{libdir}/liblzma.so'

sources:
- kind: git_tag
  url: tukaani:xz.git
  track: master
  track-extra:
  - v5.2
  exclude:
  - v*alpha
  - v*beta
  ref: v5.2.4-0-gb5be61cc06088bb07f488f9baf7d447ff47b37c1
