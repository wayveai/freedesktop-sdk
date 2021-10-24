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
  ref: libexif-0_6_23-release-0-g6801b624276f6d371ea25884c9e7a8848df2a17f
  match:
  - libexif-*
