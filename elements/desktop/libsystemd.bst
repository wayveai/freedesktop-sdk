kind: filter

depends:
- filename: desktop/systemd-base.bst
  type: build
- filename: bootstrap-import.bst
  type: runtime
- filename: base/libcap.bst
  type: runtime
- filename: base/libgcrypt.bst
  type: runtime
- filename: base/util-linux.bst
  type: runtime
- filename: base/xz.bst
  type: runtime

config:
  include:
  - libsystemd

public:
  cpe:
    vendor: 'freedesktop'
    product: 'systemd'
    version: '241'

  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsystemd.so'
