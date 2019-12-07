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
        - '%{libdir}/libicudata.so'
        - '%{libdir}/libicui18n.so'
        - '%{libdir}/libicuio.so'
        - '%{libdir}/libicutest.so'
        - '%{libdir}/libicutu.so'
        - '%{libdir}/libicuuc.so'
  cpe:
    version: '62.1'
    product: international_components_for_unicode

sources:
- kind: tar
  url: sourceforge:projects/icu/files/ICU4C/62.1/icu4c-62_1-src.tgz
  ref: 3dd9868d666350dda66a6e305eecde9d479fb70b30d5b55d78a1deffb97d5aa3
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
