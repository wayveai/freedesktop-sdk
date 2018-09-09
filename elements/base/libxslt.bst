kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libxml2.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxslt.so'
        - '%{libdir}/libexslt.so'

sources:
- kind: git_tag
  url: gnome:libxslt
  track: master
  ref: v1.1.32-0-g8307b072adb86c8064897f4c5e12e5ae142f3bff
