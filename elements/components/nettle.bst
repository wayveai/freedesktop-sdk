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

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/nettle"
      mv "%{install-root}%{includedir}/nettle/nettle-stdint.h" "%{install-root}%{prefix}/include/%{gcc_triplet}/nettle/"
      sed -i 's,"nettle-stdint.h",<nettle/nettle-stdint.h>,' "%{install-root}%{includedir}/nettle/"*

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
  ref: nettle_3.4.1_release_20181204-0-g4fc52f4de99b2d471ead06e4a5086b9b15b6dee3
