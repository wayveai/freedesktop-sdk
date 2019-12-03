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
  url: github_files:fribidi/fribidi/releases/download/v1.0.4/fribidi-1.0.4.tar.bz2
  ref: 94bdfe553e004d8bd095b109e182682311dd511740d5083326d1582f1df237be
