kind: filter

depends:
- filename: components/systemd-base.bst
  type: build
- filename: bootstrap-import.bst
  type: runtime
- filename: components/libcap.bst
  type: runtime
- filename: components/libgcrypt.bst
  type: runtime
- filename: components/util-linux.bst
  type: runtime
- filename: components/xz.bst
  type: runtime

config:
  include:
  - systemd-libs

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsystemd.so'
        - '%{libdir}/libudev.so'
