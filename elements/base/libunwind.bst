kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunwind*.so'

sources:
- kind: git
  url: git://git.sv.gnu.org/libunwind.git
  track: v1.2-stable
  ref: a77b0cd7bd14c27ff7c18463f432599ce9469c75   # v1.2.1
