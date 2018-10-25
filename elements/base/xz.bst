kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/gettext.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build


public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblzma.so'

sources:
- kind: git
  url: https://git.tukaani.org/xz.git
  ref: b5be61cc06088bb07f488f9baf7d447ff47b37c1   # v5.2.4
