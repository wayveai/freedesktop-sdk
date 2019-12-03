kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexpat.so'

  cpe:
    patches:
    - CVE-2018-20843

sources:
- kind: tar
  url: github_files:libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2
  ref: d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d473353aedf6
- kind: patch
  path: patches/expat/CVE-2018-20843.patch
  strip-level: 2
