kind: autotools

depends:
  - filename: bootstrap-import.bst

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      ../source/configure %{conf-args}

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libicudata.so"
          - "%{libdir}/libicui18n.so"
          - "%{libdir}/libicuio.so"
          - "%{libdir}/libicutest.so"
          - "%{libdir}/libicutu.so"
          - "%{libdir}/libicuuc.so"


sources:
  - kind: tar
    url: http://download.icu-project.org/files/icu4c/61.1/icu4c-61_1-src.tgz
    ref: d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef
  - kind: patch
    path: patches/icu-fix-shared-linking.patch
