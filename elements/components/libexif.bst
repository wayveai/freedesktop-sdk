kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gettext.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexif.so'

  cpe:
    version: '0.6.21'
    vendor: 'curtis_galloway'

sources:
- kind: git_tag
  url: github:libexif/libexif
  track: master
  ref: libexif-0_6_21-release-0-g9ab318d93b274df204c195c9a729f778401a8d8f
