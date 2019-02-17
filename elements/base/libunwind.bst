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
  track: v1.3-stable
  ref: v1.3.1-0-g94aa304960927c130ecb5f664a642b32d9850688
