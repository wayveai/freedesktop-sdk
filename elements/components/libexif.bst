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
        - '%{libdir}/libexif.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    vendor: 'curtis_galloway'

sources:
- kind: git_tag
  url: github:libexif/libexif.git
  track: master
  ref: libexif-0_6_22-release-0-g3cc7842ca200a4da4bd65850e3c20d5a1811afa7
  match:
  - libexif-*
