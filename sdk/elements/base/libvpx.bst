kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/perl.bst
    type: build
  - filename: base/yasm.bst
    type: build

variables:
  (?):
    - target_arch == "x86_64":
        vpxtarget: "x86_64-linux-gcc"
    - target_arch == "i586":
        vpxtarget: "x86-linux-gcc"
    - target_arch == "arm":
        vpxtarget: "armv7-linux-gcc"
    - target_arch == "aarch64":
        vpxtarget: "arm64-linux-gcc"

  conf-args: |
    --prefix="%{prefix}" \
    --libdir="%{libdir}" \
    --extra-cflags="${CFLAGS}" \
    --extra-cxxflags="${CXXFLAGS}" \
    --target="%{vpxtarget}" \
    --disable-static \
    --enable-shared \
    --enable-vp8 \
    --enable-vp9 \
    --enable-libs \
    --disable-install-docs \
    --disable-optimizations \
    --as=yasm

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libvpx.so"

sources:
  - kind: git
    url: https://chromium.googlesource.com/webm/libvpx
    track: mandarinduck
    ref: f80be22a1099b2a431c2796f529bb261064ec6b4 #  v1.7.0
