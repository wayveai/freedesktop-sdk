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
- kind: git_tag
  url: savannah:libunwind.git
  track: v1.2-stable
  ref: v1.2.1-0-ga77b0cd7bd14c27ff7c18463f432599ce9469c75
