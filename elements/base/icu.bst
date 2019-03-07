kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
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
        - '%{libdir}/libicudata.so'
        - '%{libdir}/libicui18n.so'
        - '%{libdir}/libicuio.so'
        - '%{libdir}/libicutest.so'
        - '%{libdir}/libicutu.so'
        - '%{libdir}/libicuuc.so'
  cpe:
    version: '64.1'
    product: international_components_for_unicode

sources:
- kind: git_tag
  url: github:unicode-org/icu
  track: maint/maint-64
  ref: release-64-1-0-g2f2aec5f91cffe49b7526d9b0d18a9acbdd0cc89
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
