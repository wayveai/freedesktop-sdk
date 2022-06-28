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
  url: github_files:fribidi/fribidi/releases/download/v1.0.12/fribidi-1.0.12.tar.xz
  ref: 0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495
