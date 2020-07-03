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
  url: github_files:fribidi/fribidi/releases/download/v1.0.9/fribidi-1.0.9.tar.xz
  ref: c5e47ea9026fb60da1944da9888b4e0a18854a0e2410bbfe7ad90a054d36e0c7
