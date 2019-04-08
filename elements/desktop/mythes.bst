kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/hunspell.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmythes-1.2.so'

sources:
- kind: tar
  url: sourceforge_download:hunspell/mythes-1.2.4.tar.gz
  ref: 1e81f395d8c851c3e4e75b568e20fa2fa549354e75ab397f9de4b0e0790a305f
