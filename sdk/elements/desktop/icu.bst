kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build

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

config:
  configure-commands:
    - |
      cd source
      ./%{configure}

  build-commands:
    - |
      cd source
      %{make}

  install-commands:
    - |
      cd source
      %{make-install}

sources:
  - kind: tar
    url: http://download.icu-project.org/files/icu4c/61.1/icu4c-61_1-src.tgz
    ref: d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef
