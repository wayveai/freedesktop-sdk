kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/gmp.bst
- filename: base/buildsystem-autotools.bst
  type: build


public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnettle.so'
        - '%{libdir}/libhogweed.so'

sources:
- kind: git_tag
  url: https://git.lysator.liu.se/nettle/nettle.git
  track: master
  ref: nettle_3.4.1_release_20181204-0-g4fc52f4de99b2d471ead06e4a5086b9b15b6dee3
