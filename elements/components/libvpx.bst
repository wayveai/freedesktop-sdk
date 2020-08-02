kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
  type: build
- filename: components/nasm.bst
  type: build

variables:
  (?):
  - target_arch == "x86_64":
      vpxtarget: x86_64-linux-gcc
  - target_arch == "i686":
      vpxtarget: x86-linux-gcc
  - target_arch == "arm":
      vpxtarget: armv7-linux-gcc
  - target_arch == "aarch64":
      vpxtarget: arm64-linux-gcc
  - target_arch == "ppc64le":
      vpxtarget: ppc64le-linux-gcc

  conf-args: |
    --prefix="%{prefix}" \
    --libdir="%{libdir}" \
    --enable-pic \
    --enable-optimizations \
    --target="%{vpxtarget}" \
    --disable-static \
    --enable-shared \
    --enable-vp8 \
    --enable-vp9 \
    --enable-libs \
    --disable-install-docs \
    --as=nasm

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvpx.so'

sources:
- kind: git_tag
  url: chromium:webm/libvpx.git
  track: master
  ref: v1.8.1-0-g8ae686757b708cd8df1d10c71586aff5355cfe1e
