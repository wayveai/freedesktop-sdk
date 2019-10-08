kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd "%{builddir}"
    ../icu4c/source/configure %{conf-args}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/icu-config'
        - '%{libdir}/libicudata.so'
        - '%{libdir}/libicui18n.so'
        - '%{libdir}/libicuio.so'
        - '%{libdir}/libicutest.so'
        - '%{libdir}/libicutu.so'
        - '%{libdir}/libicuuc.so'
        - '%{libdir}/icu'
        - '%{libdir}/icu/**'

  cpe:
    version: '65.1'
    product: international_components_for_unicode

sources:
- kind: git_tag
  url: github:unicode-org/icu
  track: master
  track-extra:
  - maint/maint-64
  exclude:
  - release-*-rc
  ref: release-65-1-0-gfd123bf023882f07bfacf51c39111be2f946d8f8
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
