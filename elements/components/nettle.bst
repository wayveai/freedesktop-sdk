kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gmp.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  # Work around race condition in makefiles. The following error
  # message sometimes happen:
  # /bin/sh: line 1: ./desdata: Text file busy
  notparallel: true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnettle.so'
        - '%{libdir}/libhogweed.so'

sources:
- kind: git_tag
  url: nettle:nettle.git
  track: master
  exclude:
  - nettle_*rc*
  ref: nettle_3.7.1_release_20210217-0-gc9d9c66b8ed111ab9ebd39440ec3f8d8d91734bd
