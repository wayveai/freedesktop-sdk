kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/libdatrie.bst
- filename: base/git-minimal.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libthai.so'

sources:
- kind: git_tag
  url: github:tlwg/libthai.git
  track: v0.1.27
  ref: v0.1.27-0-g4003b4adefa5a33cbbf483551dd61ef8f8d012e9
