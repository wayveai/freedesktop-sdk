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
  - target_arch == "powerpc64le":
      vpxtarget: powerpc64le-linux-gcc

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
  cpe:
    version: '1.8.0'

sources:
- kind: git_tag
  url: https://chromium.googlesource.com/webm/libvpx
  track: northernshoveler
  ref: v1.8.0-0-gb85ac11737430a7f600ac4efb643d4833afd7428
