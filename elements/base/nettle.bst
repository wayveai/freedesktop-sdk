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
- kind: git
  url: https://git.lysator.liu.se/nettle/nettle.git
  ref: 0d9930963b4891c7823ec1382fd576821388f7d2    # v3.4
