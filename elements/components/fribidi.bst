kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfribidi.so'

sources:
- kind: tar
  url: github_files:fribidi/fribidi/releases/download/v1.0.5/fribidi-1.0.5.tar.bz2
  ref: 6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d723107e8a7e6158e4ce
