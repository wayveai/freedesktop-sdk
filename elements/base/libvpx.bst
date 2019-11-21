kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build
- filename: base/nasm.bst
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
    version: '1.7.0'

sources:
- kind: git_tag
  url: chromium:webm/libvpx.git
  track: mandarinduck
  ref: v1.7.0-0-gf80be22a1099b2a431c2796f529bb261064ec6b4
