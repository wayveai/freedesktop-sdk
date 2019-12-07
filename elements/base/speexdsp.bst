kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  (?):
  - target_arch == "aarch64":
        # Without it, it tries to compile arm 32 bit assembly which
        # does not work.
      conf-local: |
        --disable-neon

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libspeexdsp.so'

sources:
- kind: tar
  url: tar_https:downloads.xiph.org/releases/speex/speexdsp-1.2rc3.tar.gz
  ref: 4ae688600039f5d224bdf2e222d2fbde65608447e4c2f681585e4dca6df692f1
