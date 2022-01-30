kind: autotools
description: X.org lib x11

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/perl.bst
- components/xorg-util-macros.bst

depends:
- bootstrap-import.bst
- components/xorg-lib-xtrans.bst
- components/xorg-lib-xcb.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libX11.so'
        - '%{libdir}/libX11-xcb.so'
  cpe:
    product: libx11
    patches:
    - CVE-2021-31535

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libx11.git
  track: master
  match:
  - "libX11-1.6.*"
  ref: libX11-1.6.12-0-g505420662577749e36640db48f6b6b9ae0236e09
- kind: patch
  path: patches/xorg-lib-x11/CVE-2021-31535.patch
