kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/git-minimal.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdatrie.so'

sources:
- kind: git_tag
  url: github:tlwg/libdatrie.git
  # Freezing due to forward ABI break
  ref: v0.2.12-0-gd5d104e22fd49a27aed8a1e9c5ccc836600c05e1
